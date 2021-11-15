dist:
	KO_DOCKER_REPO=ghcr.io/cirocosta/test \
	       ko resolve --bare -f ./config > ./dist/release.yaml
.PHONY: dist
