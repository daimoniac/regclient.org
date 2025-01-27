---
title: regctl image export
layout: single
warning: Auto generated content
---

## Synopsis

Exports an image into a tar file that can be later loaded into a docker
engine with "docker load". The tar file is output to stdout by default.
Compression is typically not useful since layers are already compressed.

```shell
regctl image export <image_ref> [filename] [flags]
```

## Examples

```shell
# export an image
regctl image export registry.example.org/repo:v1 >image-v1.tar
```

## Options

```text
      --compress          Compress output with gzip
      --name string       Name of image to embed for docker load
  -p, --platform string   Specify platform (e.g. linux/amd64 or local)
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
