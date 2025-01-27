---
title: regclient
date: 2025-01-01
---

regclient is an OCI client for registry servers and the OCI Image Layout.

## regclient Go Library

Key features of the regclient Go library include:

- Runs without a container runtime and without privileged access to the local host.
- Querying for a tag listing, repository listing, and remotely inspecting the contents of images.
- Efficiently copying and retagging images, only pulling layers when required, and without changing the image digest.
- Support for multi-platform images.
- Support for querying, creating, and copying OCI Artifacts, allowing arbitrary data to be stored in an OCI registry.
- Support for packaging OCI Artifacts with an Index of multiple artifacts, which can be used for platform specific artifacts.
- Support for querying OCI referrers, copying referrers, and pushing content with an OCI subject field, associating artifacts with other content on the registry.
- Support for the "digest tags" used by projects like sigstore/cosign, allowing the content to be included when copying images.
- Efficiently query for an image digest.
- Efficiently query for pull rate limits used by Docker Hub.
- Import and export content into OCI Layouts and Docker formatted tar files.
- Support OCI Layouts in all commands as a local disk equivalent of a repository.
- Support for deleting tags, manifests, and blobs.
- Ability to mutate existing images, including:
  - Settings annotations or labels
  - Deleting content from layers
  - Changing timestamps for reproducibility
  - Converting between Docker and OCI media types
  - Replacing the base image layers
  - Add or remove volumes and exposed ports
  - Change digest algorithms
- Support for registry warning headers, which may be used to notify users of issues with the server or content they are using.
- Automatically import logins from the docker CLI, and registry certificates from the docker engine.
- Automatic retry, and fallback to a chunked blob push, when network issues are encountered.

The Go API documentation is available at <https://pkg.go.dev/github.com/regclient/regclient>.

## regctl

`regctl` is a command line interface to the Go library designed to facilitate adhoc queries and scripting.

{{% details summary="See the features `regctl` adds to regclient" %}}

- Generating multi-platform manifests from multiple images that may have been separately built.
- Repackage a multi-platform image with only the requested platforms.
- Push and pull arbitrary OCI artifacts.
- Recursively list all content associated with an image.
- Extract files from a layer or image.
- Compare images, showing the differences between manifests, the config, and layers.
- Formatted output using Go templates.

{{% /details %}}

## regsync

`regsync` is an image mirroring tool, copying images between two locations.

{{% details summary="See the features `regsync` includes" %}}

- Ability to run on a cron schedule, one time synchronization, or only report stale images.
- Uses a yaml configuration.
- Each source may be an entire registry (not recommended), a repository, or a single image, with the ability to filter repositories and tags.
- Support for multi-platform images, OCI referrers, "digest tags", and copying to or from an OCI Layout (for maintaining a mirror over an air-gap).
- Ability to mirror multiple images concurrently.
- Support for copying a single platform from multi-platform images.
- Ability to backup an existing image before overwriting the tag.
- Ability to postpone mirror step when rate limit (used by Docker Hub) is below a threshold.
- Can use user's docker configuration for user credentials and registry certificates.

{{% /details %}}

## regbot

`regbot` is a Lua based scripting tool on top of the `regclient` API.

{{% details summary="See the features `regbot` includes" %}}

- Ability to run on a cron schedule, one time execution, or test with a dry-run mode.
- Uses a yaml configuration.
- Scripts are written in Lua and executed directly in Go.
- Built-in functions include:
  - Repository list
  - Tag list
  - Image manifest (either head or get, and optional resolving multi-platform reference)
  - Image config (this includes the creation time, labels, and other details shown in a `docker image inspect`)
  - Image rate limit and a wait function to delay the script when rate limit remaining is below a threshold
  - Image copy
  - Manifest delete
  - Tag delete

{{% /details %}}
