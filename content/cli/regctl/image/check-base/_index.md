---
title: regctl image check-base
layout: single
warning: Auto generated content
---

## Synopsis

Check the base image (found using annotations or an option).
If the base name is not provided, annotations will be checked in the image.
If the digest is available, this checks if that matches the base name.
If the digest is not available, layers of each manifest are compared.
If the layers match, the config (history and roots) are optionally compared.	
If the base image does not match, the command exits with a non-zero status.
Use "-v info" to see more details.

```shell
regctl image check-base <image_ref> [flags]
```

## Examples

```shell
# report if base image has changed using annotations
regctl image check-base ghcr.io/regclient/regctl:alpine -v info
```

## Options

```text
      --base string       Base image reference (including tag)
      --digest string     Base image digest (checks if digest matches base)
      --no-config         Skip check of config history
  -p, --platform string   Specify platform (e.g. linux/amd64 or local)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
