# pre-commit-buildifier-docker

A [pre-commit](https://pre-commit.com/) hook that runs
[buildifier](https://github.com/bazelbuild/buildtools/blob/master/buildifier/README.md)
via Docker. This formats Bazel's `BUILD`, `WORKSPACE`, and `*.bzl` files.

pre-commit supports multiple ways to implement hooks. Since buildifier is
written in Go and integrated with Bazel, it could have used golang, system (and
run `bazel run //:buildifier`), docker, and docker\_image. This hook uses
docker. This is beneficial for the situation where (1) you cannot expect the
Go runtime being installed on the system and (2) you want to avoid running Bazel
because it cannot concurrently run two invocations. Since there's no existing
Docker image for buildifier, this uses docker instead of docker\_image.
