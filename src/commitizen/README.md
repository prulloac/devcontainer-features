
# commitizen (via pipx) (commitizen)

Installs commitizen cli.

## Example Usage

```json
"features": {
    "ghcr.io/prulloac/devcontainer-features/commitizen:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | commitizen version to install | string | latest |

## Adding third party templates

In order to add third party templates, you can use the following script either manually after container initialization or within your devcontainer configuration file within a lifecycle hook.

```bash:
pipx inject commitizen <template> --include-deps --system-site-packages
```

> Make sure that `pipx` is also available within your container. 


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/prulloac/devcontainer-features/blob/main/src/commitizen/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
