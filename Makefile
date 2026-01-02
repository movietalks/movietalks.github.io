build:
	rm -rf docs/
	hugo -d docs && bun run build

preview:
	python3 -m http.server 1313 --directory docs

install:
	bun install