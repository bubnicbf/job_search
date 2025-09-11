# ===== Makefile =====
# Build LaTeX docs with XeLaTeX, PDFs in output/, aux in build_artifact/

# ===== config =====
ENGINE       := xelatex
SRC_DIR      := src
OUT_DIR      := output
AUX_DIR      := build_artifact
DOCS         := cv abstract resume
PDFS         := $(DOCS:%=$(OUT_DIR)/%.pdf)

# XeLaTeX flags
XELATEX_FLAGS := -synctex=1 -interaction=nonstopmode \
                 -output-directory=../$(OUT_DIR) \
                 -aux-directory=../$(AUX_DIR)

# ===== public targets =====
.PHONY: all cv abstract resume clean distclean open

all: $(PDFS)

cv:        $(OUT_DIR)/cv.pdf
abstract:  $(OUT_DIR)/abstract.pdf
resume:    $(OUT_DIR)/resume.pdf

# macOS convenience: open the resume PDF
open: $(OUT_DIR)/resume.pdf
	@open "$(OUT_DIR)/resume.pdf"

# ===== build rule =====
# Build each PDF by (1) ensuring dirs, (2) running XeLaTeX twice for refs
$(OUT_DIR)/%.pdf: $(SRC_DIR)/%.tex
	@mkdir -p "$(OUT_DIR)" "$(AUX_DIR)"
	@echo "==> Building $*"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "$*.tex"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "$*.tex"
	@echo "==> Wrote $(OUT_DIR)/$*.pdf"

# ===== cleaning =====
clean:
	@echo "==> Cleaning aux/logs"
	@rm -rf "$(AUX_DIR)"/*
	@find "$(OUT_DIR)" -name '*.synctex.gz' -delete || true

distclean: clean
	@echo "==> Removing PDFs"
	@rm -f $(OUT_DIR)/*.pdf
