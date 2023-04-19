.PHONY: build test clean

build:
	scarb build

test:
	scarb run test

clean:
	scarb clean

run:
	scarb run cairo
