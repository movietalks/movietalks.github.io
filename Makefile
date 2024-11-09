build:
	rm -rf docs/
	hugo -d docs && npm run build

preview:
	python3 -m http.server 1313 --directory docs