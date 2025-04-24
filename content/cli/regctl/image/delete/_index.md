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
# delete a manifest by digest
regctl manifest delete registry.example.org/repo@sha256:fab3c890d0480549d05d2ff3d746f42e360b7f0e3fe64bdf39fc572eab94911b

# delete the digest referenced by a tag (this is unsafe)
regctl manifest delete registry.example.org/repo:v1.2.3 --force-tag-dereference

# delete the digest and all manifests with a subject referencing the digest
regctl manifest delete --referrers \
  registry.example.org/repo@sha256:fab3c890d0480549d05d2ff3d746f42e360b7f0e3fe64bdf39fc572eab94911b
```

## Options

```text
      --force-tag-dereference   Dereference the a tag to a digest, this is unsafe
      --ignore-missing          Ignore errors if manifest is missing
      --referrers               Check for referrers, recommended when deleting artifacts
```

## Options from parent commands

```text
      --host stringArray     Registry hosts to add (reg=registry,user=username,pass=password,tls=enabled)
      --logopt stringArray   Log options
      --user-agent string    Override user agent
  -v, --verbosity string     Log level (trace, debug, info, warn, error) (default "WARN")
```
