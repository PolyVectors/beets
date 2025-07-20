.PHONY: build vendor clean

build: vendor
	hcc -obj src/main.HC -o main
	gcc main.o bin/* -o main
	rm main.o
	
vendor:
	mkdir bin
	$(MAKE) -C ./vendor/concord
	mv ./vendor/concord/lib/libdiscord.a bin

clean:
	rm main
	rm -rf bin
