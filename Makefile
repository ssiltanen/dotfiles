init:
	./scripts/symlink-brewfile.sh && ./scripts/install-packages.sh && ./scripts/symlink.sh && ./scripts/install-fisher.sh

ssh-key:
	./scripts/ssh-key.sh $(service) $(host) $(label)

.PHONY: init ssh-key