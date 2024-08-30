init:
	./scripts/symlink-brewfile.sh && ./scripts/install-packages.sh && ./scripts/symlink.sh && ./scripts/install-fisher.sh && ./scripts/install-eslint.sh "prerelease/3.0.13"

ssh-key:
	./scripts/ssh-key.sh $(service) $(host) $(label)

.PHONY: init ssh-key
