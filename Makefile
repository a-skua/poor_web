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
