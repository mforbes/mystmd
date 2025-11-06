NPM = pixi run npm

test-pdf: up
	cd packages/mystmd && $(NPM) run test -- -t "PDF Generation with latexmkrc file - issue 1855"

up:
	$(NPM) run build

go:
	$(NPM) install
	$(NPM) run build

test-full: up
	$(NPM) run test -- -t "PDF Generation with latexmkrc file - issue 1855"

clean:
	$(NPM) unlink mystmd

.PHONY: go clean up test-pdf test-full
