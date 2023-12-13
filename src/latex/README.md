
# LaTeX Workshop (latex)

Installs Tex Live latex compiler with tlmgr package manager, alongside LaTeX Workshop extension

## Example Usage

```json
"features": {
    "ghcr.io/prulloac/devcontainer-features/latex:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| scheme | Gives the option select which scheme is used to install Tex Live. See https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-340003.4.2 for more information. | string | basic |
| packages | Comma separated list of packages to install with tlmgr. See https://www.tug.org/texlive/doc/tlmgr.html#installing-packages for more information. | string | - |

## Customizations

### VS Code Extensions

- `James-Yu.latex-workshop`

## Notes

If you chose to use a different schema, make sure to install latexmk to properly keep the LaTeX Workshop extension working.

## Installing additional packages

To install additional LaTeX packages, you can use `tlmgr install <package>` to download and install packages, but be sure to afterwards update your `PATH`.

`tlmgr` can be used to update `PATH` by doing the following:

- Set `tlmgr option sys_bin /usr/local/bin` * Run this once
- After installing required packages, run `tlmgr path add`


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/prulloac/devcontainer-features/blob/main/src/latex/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
