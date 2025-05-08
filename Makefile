.PHONY: example
example: example/poor_web_example.wasm

%.wasm: %.dart
	dart compile wasm \
		--output=$@ \
		--optimization-level=4 \
		--no-source-maps \
		$<

.PHONY: check
check:
	@dart pub publish --dry-run

.PHONY: test
test:
	@for p in vm chrome node; do \
		echo "[$$p]"; \
		dart test -p $$p; \
	done

.PHONY: clean
clean:
	@rm -f example/*.mjs example/*.wasm
