CV_FILE := cv/Mirno_Hoogendonk_CV.yaml

# Default path by rendercv
OUTPUT_DIR := cv/rendercv_output/

MD_CV := ../cv.md

VENV := .venv
PY := $(VENV)/bin/python
RENDERCV := uv run rendercv

.PHONY: build watch clean lint lint-yaml lint-typos deps

deps:
	uv sync

build: deps
	$(RENDERCV) render $(CV_FILE) -md $(MD_CV)
	@echo ""
	@echo "CV files generated in $(OUTPUT_DIR)"
	@echo "CV markdown generated in $(MD_CV)"

build:
	$(RENDERCV) render $(CV_FILE) -md $(MD_CV)
	@echo ""
	@echo "CV files generated in $(OUTPUT_DIR)"
	@echo "CV markdown generated in $(MD_CV)"

watch:
	@echo "Watching for changes..."
	$(RENDERCV) render $(CV_FILE) --watch

clean:
	rm -rf $(OUTPUT_DIR)

lint: lint-yaml lint-typos

lint-yaml:
	@echo "Running yamllint..."
	yamllint .

lint-typos:
	@echo "Running typos..."
	typos .
