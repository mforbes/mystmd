NPM = pixi run npm

up:
	$(NPM) run build

go:
	$(NPM) install
	$(NPM) run build

test: up
	$(NPM) run test

clean:
	$(NPM) unlink mystmd

.PHONY: go clean up
