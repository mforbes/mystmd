# Issue 8855

## PDF Tests

There don't seem to be any integration tests for PDF generation, so I am starting with
that. Part of the problem is that the PDF will change each run (there are timestamps or
other things internally), but one can at least test the production of a PDF file by only
including a `path` component in `exports.yml` -- thanks to @fwkoch for the suggestion.

I don't know yet how to actually test the output of a PDF file, but one good strategy
might be to find a tool that someone with accessibility issues might use to generate a
textual representation of the file, and then ensure that this matches.  This would
double as establishing a path to ensure ADA compliance in the future (something I am
thinking about for our university.)

## Latexmk

The actual issue [#1855][] is the use of a potentially corrupt global `.latexmkrc` file.
This can be simulated by setting `XDG_CONFIG_HOME` and including a bad `latexmkrc` file in
`${XDG_CONFIG_HOME}/latexmk/latexmkrc`.

Currently I hard-code this in the actual call of `latexmk` in `export.ts`.  This is
really bad, but:

* I don't know how to set environment variables for tests.
* I don't know how to copy files to the temp directory where `latexmk` is run.

## Workflow

For this branch, I have added a few files so I can use [pixi][] to provision a test
environment (`pixi add nodejs typescript`) and run my specific test with

```bash
make test-pdf-fast  # No update

# OR

make test-pdf  # Also runs npm up
```

These should be removed before submitting the final PR.

[#1855]: <https://github.com/jupyter-book/mystmd/issues/1855>
[pixi]: <https://pixi.sh>
