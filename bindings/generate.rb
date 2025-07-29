if ARGV.length != 2
    abort(USAGE)
end

USAGE = "Usage: generate INFILE OUTFILE"

TYPE_CONVERSIONS = {
    "char" => "c::char",
    "int" => "i32",
    "unsigned" => "u32",
    "size_t" => "size",
    "int64_t" => "i64",
}

module Definition
    NONE = 0
    STRUCT = 1
    ENUM = 2
    FUNCTION = 3
end

def convert_type(type, is_pointer)
    type = type.prepend('*') if is_pointer
    type = "*opaque" if type == "*void"

    if TYPE_CONVERSIONS.has_key?(type) then
        return TYPE_CONVERSIONS[type]
    elsif type.start_with?("enum") or type.start_with?("struct")
        return type.split.last
    end

    return type
end

infile = File.open(ARGV[0])

current_defined = Definition::NONE
outfile_contents = ""

infile.read.split("\n").each_with_index { |line, index|
    line = line.strip
    next if line.start_with?("/*", "*/", "*") or line.empty?

    if line.include?("struct") && line.include?("{")
        current_defined = Definition::STRUCT
    elsif line.include?("enum") && line.include?("{")
        current_defined = Definition::ENUM
    end

    case current_defined
    when Definition::STRUCT
        case line
        when /struct/
            outfile_contents << "export type #{line.split[1]} = struct {\n"
        when /};/
            outfile_contents << line + "\n\n"
        else
            name = line.split.last.chomp(';')
            is_pointer = name.start_with?('*')
            name = name[1..-1] if is_pointer

            type = convert_type(line.split[0..-2].join(' '), is_pointer)
            outfile_contents << "\t#{name}: #{type},\n"
        end
    when Definition::ENUM
        case line
        when /enum/
            outfile_contents << "export type #{line.split[1]} = enum {\n"
        when /};/
            outfile_contents << line + "\n\n"
        else
            outfile_contents << "\t#{line}\n"
        end
    end 

    current_defined = Definition::NONE if line.start_with?("};")
}
outfile_contents = outfile_contents.strip
infile.close()

outfile = File.new(ARGV[1], "w")
outfile.write(outfile_contents)
outfile.close()