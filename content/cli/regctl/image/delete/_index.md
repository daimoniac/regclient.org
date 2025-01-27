---
title: regctl image delete
layout: single
warning: Auto generated content
---

## Synopsis

Delete a manifest. This will delete the manifest, and all tags pointing to that
manifest. You must specify a digest, not a tag on this command (e.g. 
image_name@sha256:1234abc...). It is up to the registry whether the delete
API is supported. Additionally, registries may garbage collect the filesystem
layers (blobs) separately or not at all. See also the "tag delete" command.

```shell
regctl image delete <image_ref> [flags]
```

## Aliases

- del
- rm
- remove

## Examples

```shell
# delete a specific image
regctl image delete registry.example.org/repo@sha256:fab3c890d0480549d05d2ff3d746f42e360b7f0e3fe64bdf39fc572eab94911b

# delete a specific image by tag (including all other tags to the same image)
regctl image delete --force-tag-dereference registry.example.org/repo:v123
```

## Options

```text
      --force-tag-dereference   Dereference the a tag to a digest, this is unsafe
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
