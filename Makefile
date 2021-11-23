dist:
	KO_DOCKER_REPO=ghcr.io/bmoussaud/test \
	       ko resolve --bare -f ./config > ./dist/release.yaml
.PHONY: dist


NAMESPACE=deliverable

.PHONY: delivery
delivery:
	kapp deploy -a delivery -f ci/cluster --into-ns $(NAMESPACE)

.PHONY: deliverable
deliverable:
	kapp deploy -a deliverable -f ci/deliverable.yaml --into-ns $(NAMESPACE)

watch:
	kubectl tree deliverable test -n $(NAMESPACE)

logs:
	