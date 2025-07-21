.PHONY: build vendor clean

HARE=hare
HAREFLAGS=-ldiscord -L./bin/

build: vendor
	$(HARE) build $(HAREFLAGS) src/main.ha
	
vendor:
	mkdir -p bin
	$(MAKE) -C ./vendor/concord
	mv ./vendor/concord/lib/libdiscord.a bin

clean:
	rm -f main
	rm -rf bin
