---
title: regctl image import
layout: single
warning: Auto generated content
---

## Synopsis

Imports an image from a tar file. This must be either a docker formatted tar
from "docker save" or an OCI Layout compatible tar. The output from
"regctl image export" can be used. Stdin is not permitted for the tar file.

```shell
regctl image import <image_ref> <filename> [flags]
```

## Examples

```shell
# import an image saved from docker
regctl image import registry.example.org/repo:v1 image-v1.tar
```

## Options

```text
      --name string   Name of image or tag to import when multiple images are packaged in the tar
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
