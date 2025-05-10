SRC:=$(shell find lib -name '*.dart')

.PHONY: example
example: example/example.wasm example/poor_web_example.wasm

.PHONY: serve
serve: example
	python3 -m http.server -d example

%.wasm: %.dart $(SRC)
	dart compile wasm --optimization-level=4 --no-source-maps --output=$@ $<

.PHONY: check
check:
	@dart pub publish --dry-run

.PHONY: test
test:
	@for p in vm chrome node; do \
		echo "[$$p]"; \
		dart test -p $$p; \
	done

.PHONY: fmt
fmt:
	@dart format .

.PHONY: analyze
analyze:
	@dart analyze

doc: $(SRC)
	@dart doc --output=$@
	@python3 -m http.server -d $@

.PHONY: clean
clean:
	@rm -rf example/*.mjs example/*.wasm example/*.map doc
