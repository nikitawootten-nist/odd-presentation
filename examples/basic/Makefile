.PHONY: build
build: comparison_basic.json comparison_no-uuid.json

comparison_basic.json:
	oscal-deep-diff \
		--leftPath old.json \
		--rightPath new.json \
		--outputPath comparison_basic.json \
		--config config_comparison_basic.yaml

comparison_no-uuid.json:
	oscal-deep-diff \
		--leftPath old.json \
		--rightPath new.json \
		--outputPath comparison_no-uuid.json \
		--config config_comparison_no-uuid.yaml

.PHONY: clean
clean:
	rm -f comparison_*.json
