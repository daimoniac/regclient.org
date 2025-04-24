---
title: regctl tag delete
layout: single
warning: Auto generated content
---

## Synopsis

Delete a tag in a repository.
This avoids deleting the manifest when multiple tags reference the same image.
For registries that do not support the OCI tag delete API, this is implemented
by pushing a unique dummy manifest and deleting that by digest.
If the registry does not support the delete API, the dummy manifest will remain.

```shell
regctl tag delete <image_ref> [flags]
```

## Aliases

- del
- rm
- remove

## Examples

```shell
# delete a tag
regctl tag delete registry.example.org/repo:v42
```

## Options

```text
      --ignore-missing   Ignore errors if tag is missing
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
