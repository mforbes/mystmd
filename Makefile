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

rups: .pixi/envs/default/bin/itext-rups-25.03.jar
	-pixi task remove rups
	pixi task add rups "java -jar $<"	

.PHONY: go clean up test-pdf test-pdf-fast test-full rups

_zips/iText-RUPS-25.03.zip:
	mkdir -p _zips
	cd _zips && wget https://github.com/itext/rups/releases/download/25.03/iText-RUPS-25.03.zip

.pixi/envs/default/bin/itext-rups-25.03.jar: _zips/iText-RUPS-25.03.zip
	cd _zips && unzip $<
	mv _zips/itext-rups-25.03.jar $@

