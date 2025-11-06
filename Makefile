NPM = pixi run npm

test-pdf-fast:
	cd packages/mystmd && $(NPM) run test -- -t "PDF Generation with latexmkrc file - issue 1855"

test-pdf: up test-pdf-fast

test-full: up
	$(NPM) run test

up:
	$(NPM) run build

go:
	$(NPM) install
	$(NPM) run build

clean:
	$(NPM) unlink mystmd
	$(RM) -r _zips

.PHONY: go clean up test-pdf test-pdf-fast test-full
