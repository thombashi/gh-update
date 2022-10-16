.PHONY: setup-fmt
setup-fmt:
	@go install "mvdan.cc/sh/v3/cmd/shfmt@latest"
	shfmt --version

.PHONY: fmt
fmt:
	@shfmt -i 4 -l -w -ci -sr -kp -f gh-update

.PHONY: tag
tag:
	@git tag -a $(shell cat ./tag) -m "SHA: $(shell git rev-parse HEAD)"

.PHONY: release
release:
	@git push --tags
