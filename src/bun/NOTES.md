## Notes

If you chose to use a different schema, make sure to install latexmk to properly keep the LaTeX Workshop extension working.

## Installing additional packages

To install additional LaTeX packages, you can use `tlmgr install <package>` to download and install packages, but be sure to afterwards update your `PATH`.

`tlmgr` can be used to update `PATH` by doing the following:

- Set `tlmgr option sys_bin /usr/local/bin` * Run this once
- After installing required packages, run `tlmgr path add`
