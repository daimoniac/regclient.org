---
title: FAQ
layout: single
date: 2025-01-01
---

{{% toc %}}

## How do I use HTTP instead of HTTPS?

**Q:** I'm getting `http: server gave HTTP response to HTTPS client`.

With `regctl` use:

```shell
regctl registry set --tls disabled <registry>
```

For `regsync` and `regbot` use:

```yaml
creds:
  - registry: registry.example.org:5000
    tls: disabled
```

## Space is not freed after deleting images

Registries typically have a garbage collection process to run to cleanup untagged manifests and unused blobs.
This varies by registry, but it's strongly encouraged that you test this and keep a backup, particularly with multi-platform images and content pushed using the subject / referrer to associate artifacts with images.

## How delete content from a registry

Many registries have limitations on deleting content.
Some my not support the OCI APIs that regclient supports, but have their own custom API.
Others may limit delete APIs to only manifest digests, or tags, intentionally disabling other APIs due to the version of the spec they implemented or preventing deletes for data integrity.
Registries that do support the delete APIs may require additional roles on the user account performing the action.

When registries do allow the OCI delete APIs, tag deletion is the recommended method.
With `regctl`, that is `regctl tag rm`.
With `regbot`, there is a `tag.delete` function.
And with the regclient Go library, there is a [`RegClient.TagDelete` method](https://pkg.go.dev/github.com/regclient/regclient#RegClient.TagDelete).

## How to avoid storing passwords in config files

Credential helpers may be set with `regctl registry set --cred-helper` or in `regsync` and `regbot` with:

```yaml
creds:
  - registry: registry.example.org:5000
    credHelper: docker-credential-custom-helper
```

Importing the docker configuration from `$HOME/.docker/config.json` will detect credential helpers like the following:

```jsonc
"credHelpers": {
  "gcr.io": "gcr", 
  "public.ecr.aws": "ecr-login", 
}
```

Note that the docker configuration removes the `docker-credential-` prefix from the process name, so the above would look for `docker-credential-gcr` and `docker-credential-ecr-login` binaries.

The alpine image variants ship with the `ecr-login` and `gcr` credential helpers.
For other helpers, either using the standalone binaries or building a custom image is recommended.
You will need to include the source for the credentials as a volume when running in a container (e.g. `$HOME/.aws` and `$HOME/.config/gcloud`).

Note that the `gcloud` helper is not included since it results in a significant increase in the alpine image size (40M vs over 500M).
Instead you can switch to `gcr` and copy your key to `$HOME/.config/gcloud/application_default_credentials.json`.
For more details on the gcr helper, see <https://github.com/GoogleCloudPlatform/docker-credential-gcr>.

## Preventing authentication issues when accessing multiple repositories?

regclient manages a single token per registry by default.
Some registries expect a single token per repository and either silently fail or throw an error when the number of scopes (one per registry) in the token grows too large.
This can be solved to limiting the authentication to a single repository on those registries.
In yaml configurations for `regsync` and `regbot`, set the `repoAuth` flag to true for those registries:

```yaml
creds:
- registry: gcr.io
  repoAuth: true
```

For `regctl`, use `regctl registry set --repo-auth gcr.io`.

## Specify the windows OS Version as a platform

The platform parsing in regclient will default to your local windows version when the OS and architecture matches.
For explicitly passing the OS version, a comma separated syntax is available in regclient: `windows/amd64,osver=10.0.17763.4974`.
