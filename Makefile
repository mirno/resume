CV_FILE := cv/Mirno_Hoogendonk_CV.yaml

# Paths are relative to the input file (cv/)
OUT_DIR_REL := rendercv_output
PDF_REL := $(OUT_DIR_REL)/Mirno_Hoogendonk_CV.pdf
MD_REL := cv.md

RENDERCV := uv run rendercv

.PHONY: deps build watch clean lint lint-yaml lint-typos

deps:
	uv sync

build: deps
	@mkdir -p cv/$(OUT_DIR_REL)
	$(RENDERCV) render $(CV_FILE) -pdf $(PDF_REL) -md $(MD_REL)
	@echo ""
	@echo "CV PDF generated at cv/$(PDF_REL)"
	@echo "CV markdown generated at cv/$(MD_REL)"

watch: deps
	@echo "Watching for changes..."
	$(RENDERCV) render $(CV_FILE) -pdf $(PDF_REL) -md $(MD_REL) --watch

clean:
	rm -rf cv/$(OUT_DIR_REL) cv/$(MD_REL)

lint: lint-yaml lint-typos

lint-yaml:
	@echo "Running yamllint..."
	yamllint .

lint-typos:
	@echo "Running typos..."
	typos .
