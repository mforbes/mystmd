# Issue 8855

I can demonstrated the issue by including a bad `latexmkrc` file in
`${XDG_CONFIG_HOME}/latexmk/latexmkrc`, but I don't know how to get myst to find this
generally because:

* I don't know how to set environment variables for tests.
* I don't know how to copy files to the temp directory where `latexmk` is run.

To demonstrate the issue, I can explicitly set `XDG_CONFIG_HOME` before I run
latexmk... but am not sure how to do this only for the test.

My workflow:
```bash
make test-pdf
```
