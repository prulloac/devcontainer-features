## Adding third party templates

In order to add third party templates, you can use the following script either manually after container initialization or within your devcontainer configuration file within a lifecycle hook.

```bash:
pipx inject commitizen <template> --include-deps --system-site-packages
```

> Make sure that `pipx` is also available within your container. 
