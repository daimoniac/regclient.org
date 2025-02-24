# configure a local registry without TLS
regctl registry set localhost:5000 --tls disabled

# list tags
regctl tag ls busybox | more

# show the image config and manifest without pulling the image
regctl image inspect busybox:latest
regctl image manifest busybox:latest | more
regctl image manifest busybox:latest --platform local

# copy an image to the local registry, preserving digests
regctl image copy busybox:latest localhost:5000/library/busybox:latest
regctl tag ls localhost:5000/library/busybox
regctl image digest busybox:latest
regctl image digest localhost:5000/library/busybox:latest

# copy an image to disk (using an OCI Layout) for air gapped transport
regctl image copy localhost:5000/library/busybox:latest ocidir://busybox:latest
regctl tag ls ocidir://busybox

# create a new multi-platform image with selected platforms of a remote image
regctl index create localhost:5000/library/busybox:min --ref busybox:latest \
  --platform linux/amd64 --platform linux/arm64
regctl manifest get localhost:5000/library/busybox:min

# output a file from the filesystem of a remote image
regctl image get-file localhost:5000/library/busybox:latest /etc/passwd

# create an artifact and then retrieve it
echo "hello demo!" | \
  regctl artifact put --artifact-type application/vnd.example.hello \
    localhost:5000/example/artifact:hello
regctl manifest get localhost:5000/example/artifact:hello
regctl artifact get localhost:5000/example/artifact:hello

# list and display artifacts for a specific image using the referrers API
regctl artifact list regclient/regctl:latest --platform local | more
regctl artifact get --subject regclient/regctl:latest --platform local \
  --filter-artifact-type application/spdx+json | jq . | more
