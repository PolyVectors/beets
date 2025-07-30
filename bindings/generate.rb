if ARGV.length != 2
    abort(USAGE)
end

USAGE = "Usage: generate INFILE OUTFILE"

module Definition
    NONE = 0
    STRUCT = 1
    ENUM = 2
    FUNCTION = 3
end

indentation_amount = 1

def convert_type(name, type, is_pointer, indentation_amount)
    # TODO: what is the idiomatic way to do this???
    case type
    when "int"
        type = "i32"
    when "unsigned"
        type = "u32"
    when "char"
        type = "c::char"
    when "size_t"
        type = "size"
    when "int64_t"
        type = "i64"
    end

    if type.start_with?("enum") or type.start_with?("struct")
        type = type.split.last
        return type
    end

    type = type.prepend('*') if is_pointer
    type = "*opaque" if type == "*void"

    if name.include?("[")
        type.prepend(name.split("[")[1..-1].join("[").prepend("["))
        name = name.split("[").first
    end

    return type
end

infile = File.open(ARGV[0])

current_defined = Definition::NONE

formatted_infile = Array.new
outfile_contents = ""

infile.read.split("\n").each_with_index{ |line|
    line = line.strip
    next if line.start_with?("/*", "*/", "*") || line.empty?
    next if line.start_with?("#ifndef", "#ifdef", "#endif", "extern", "#include")
    formatted_infile << line + "\n"
}.join("\n")

index = 0
while index < formatted_infile.length do
    line = formatted_infile[index].strip

    if line.include?("struct") && line.include?("{")
        current_defined = Definition::STRUCT
    elsif line.include?("enum") && line.include?("{")
        current_defined = Definition::ENUM
    end

    case current_defined
    when Definition::STRUCT
        case line
        when /^struct {$/
            for i in index..formatted_infile.length - 1 do
                l = formatted_infile[i].strip

                if l.start_with?("}") && l.end_with?(";") && l != "};"
                    is_pointer = l.include?("*")
                    name = l.split("}").last.chomp(";").strip
                    name = name[2..-1] if is_pointer

                    outfile_contents << "#{"\t"*indentation_amount}#{name}: #{"*" if is_pointer}struct {\n"
                    indentation_amount += 1

                    break
                end
            end
        when /^struct/
            if line[-1] == ";"
                name = line.split.last[0..-2]
                is_pointer = name.start_with?('*')
                name = name[1..-1] if is_pointer
                type = line.split[1]
                outfile_contents << "#{"\t"*indentation_amount}#{name}: #{"*" if is_pointer}#{type},\n"
            else
                outfile_contents << "export type #{line.split[1]} = struct {\n"
            end
        when /^};$/
            outfile_contents << line + "\n\n"
        when /^\}.*;\s*$/
            indentation_amount -= 1
            outfile_contents << "#{"\t"*indentation_amount}},\n"
        when /.*\(.*\);\s*/
            name = line.split("(*")[1].split(")").first
            return_type = convert_type(name, line.split("(").first.strip, false, indentation_amount)

            params = line.split("(").last.chomp(");").split(",").map do |param|
                convert_type(name, param.strip, false, indentation_amount)
            end.join(", ")

            outfile_contents << "#{"\t"*indentation_amount}#{name}: *fn(#{params}) #{return_type},\n"
        else
            name = line.split.last.chomp(';')
            is_pointer = name.start_with?('*')
            name = name[1..-1] if is_pointer
            type = convert_type(name, line.split[0..-2].join(' '), is_pointer, indentation_amount)

            outfile_contents << "#{"\t"*indentation_amount}#{name}: #{type},\n"
        end
    when Definition::ENUM
        case line
        when /^enum/
            outfile_contents << "export type #{line.split[1]} = enum {\n"
        when /^};$/
            outfile_contents << line + "\n\n"
        else
            outfile_contents << "\t#{line}\n"
        end
    when Definition::FUNCTION
        
    end

    current_defined = Definition::NONE if line.start_with?("};")
    index += 1
end

outfile_contents = outfile_contents.strip
infile.close()

outfile = File.new(ARGV[1], "w")
outfile.write(outfile_contents)
outfile.close()