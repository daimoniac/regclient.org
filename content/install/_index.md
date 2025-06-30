---
title: Installing
layout: single
date: 2025-01-01
---

- [Downloading Binaries](#downloading-binaries)
- [Running as a Container](#running-as-a-container)
- [Building From Source](#building-from-source)
- [GitHub Actions](#github-actions)
- [Verifying Signatures](#verifying-signatures)
- [Reproducible Builds](#reproducible-builds)
- [Community Maintained Packages](#community-maintained-packages)
  - [Brew](#brew)
  - [MacPorts](#macports)
  - [RPM](#rpm)
  - [Snap](#snap)
  - [Wolfi](#wolfi)

## Downloading Binaries

Binaries are available on the [releases page](https://github.com/regclient/regclient/releases).

The latest release can be downloaded using curl (adjust "regctl" and
"linux-amd64" for the desired command and your own platform):

```shell
curl -L https://github.com/regclient/regclient/releases/latest/download/regctl-linux-amd64 >regctl
chmod 755 regctl
```

Merges into the main branch also have binaries available as artifacts within [GitHub Actions](https://github.com/regclient/regclient/actions/workflows/go.yml?query=branch%3Amain)

Binaries downloaded on MacOS systems may have the quarantine attribute set.
That [attribute can be removed](https://apple.stackexchange.com/questions/243687/allow-applications-downloaded-from-anywhere-in-macos-sierra) with the following command (replacing `regctl` with the path to the binary to modify):

```shell
xattr -d com.apple.quarantine regctl
```

## Running as a Container

You can run `regctl`, `regsync`, and `regbot` in a container.

For `regctl` (include a `-t` for any commands that require a tty, e.g. `registry login`):

```shell
docker container run -i --rm --net host \
  -v regctl-conf:/home/appuser/.regctl/ \
  ghcr.io/regclient/regctl:latest --help
```

For `regsync`:

```shell
docker container run -i --rm --net host \
  -v "$(pwd)/regsync.yml:/home/appuser/regsync.yml" \
  ghcr.io/regclient/regsync:latest -c /home/appuser/regsync.yml check
```

For `regbot`:

```shell
docker container run -i --rm --net host \
  -v "$(pwd)/regbot.yml:/home/appuser/regbot.yml" \
  ghcr.io/regclient/regbot:latest -c /home/appuser/regbot.yml once --dry-run
```

On Linux and Mac environments, here's example shell script to run `regctl` in a container with settings for accessing content as your own user and using docker credentials and certificates:

```shell
#!/bin/sh
opts=""
case "$*" in
  "registry login"*) opts="-t";;
esac
docker container run $opts -i --rm --net host \
  -u "$(id -u):$(id -g)" -e HOME -v $HOME:$HOME \
  -v /etc/docker/certs.d:/etc/docker/certs.d:ro \
  ghcr.io/regclient/regctl:latest "$@"
```

Images are also included with an alpine base, which are useful for CI pipelines that expect the container to include a `/bin/sh`.
These alpine based images also include the `ecr-login` and `gcr` credential helpers.

## Building From Source

Installing commands directly with Go may be done using:

```shell
go install github.com/regclient/regclient/cmd/regctl@latest
go install github.com/regclient/regclient/cmd/regsync@latest
go install github.com/regclient/regclient/cmd/regbot@latest
```

For development, code can be built using `make`:

```shell
git clone https://github.com/regclient/regclient.git
cd regclient
make
bin/regctl version
```

## GitHub Actions

GitHub Actions have been provided at [github.com/regclient/actions](https://github.com/regclient/actions).
An example of installing `regctl` and logging into GHCR looks like:

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    name: example
    steps:
      - name: Install regctl
        uses: regclient/actions/regctl-installer@main
      - name: regctl login
        uses: regclient/actions/regctl-login@main
```

For more details, see the [github.com/regclient/actions](https://github.com/regclient/actions) repo.

## Verifying Signatures

Binaries and images have been signed with cosign.

For images:

```shell
cosign verify \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp https://github.com/regclient/regclient/.github/workflows/ \
  ghcr.io/regclient/regctl:latest
```

For binaries:

```shell
curl -L https://github.com/regclient/regclient/releases/latest/download/regctl-linux-amd64 >regctl
chmod 755 regctl
curl -L https://github.com/regclient/regclient/releases/latest/download/metadata.tgz >metadata.tgz
tar -xzf metadata.tgz regctl-linux-amd64.pem regctl-linux-amd64.sig
cosign verify-blob \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com \
  --certificate-identity-regexp https://github.com/regclient/regclient/.github/workflows/ \
  --certificate regctl-linux-amd64.pem \
  --signature regctl-linux-amd64.sig \
  regctl
rm metadata.tgz regctl-linux-amd64.pem regctl-linux-amd64.sig
```

## Reproducible Builds

Images can be rebuilt reproducibly.
This requires the following:

- source code to be cloned locally
- docker with buildx
- regctl
- syft

```shell
make oci-image

# compare regctl digests to edge/main
regctl image digest ocidir://output/regctl:scratch
regctl image digest ghcr.io/regclient/regctl:edge
regctl image digest ocidir://output/regctl:alpine
regctl image digest ghcr.io/regclient/regctl:edge-alpine

# compare regsync digests to edge/main
regctl image digest ocidir://output/regsync:scratch
regctl image digest ghcr.io/regclient/regsync:edge
regctl image digest ocidir://output/regsync:alpine
regctl image digest ghcr.io/regclient/regsync:edge-alpine

# compare regbot digests to edge/main
regctl image digest ocidir://output/regbot:scratch
regctl image digest ghcr.io/regclient/regbot:edge
regctl image digest ocidir://output/regbot:alpine
regctl image digest ghcr.io/regclient/regbot:edge-alpine
```

To verify an arbitrary image, a convenience shell script is available:

```shell
./build/reproduce.sh $image # e.g. "ghcr.io/regclient/regctl:v0.8.1"
```

This will switch the git repo to a matching commit, perform the build of both the scratch and alpine variants of the requested image, and verify the digest matches.

## Community Maintained Packages

The following methods to install regclient are maintained by community contributors.

### Brew

<https://formulae.brew.sh/formula/regclient>

```shell
brew install regclient
```

### MacPorts

<https://ports.macports.org/port/regclient>

```shell
sudo port install regclient
```

### RPM

RHEL / Centos / Rocky / Fedora

<https://yum.jc21.com>

```shell
dnf install regclient
```

### Snap

<https://snapcraft.io/regclient>

```shell
snap install regclient
```

### Wolfi

<https://github.com/wolfi-dev/os/blob/main/regclient.yaml>

```shell
apk add regclient
```

