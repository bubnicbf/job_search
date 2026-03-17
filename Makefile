MAKEFLAGS += -B

ENGINE   := xelatex
SRC_DIR  := src
OUT_DIR  := output
DOCS     := cv abstract resume cover
PDFS     := $(DOCS:%=$(OUT_DIR)/%.pdf)

XELATEX_FLAGS := -synctex=1 -interaction=nonstopmode -file-line-error \
                 -output-directory=../$(OUT_DIR)

.PHONY: all cv abstract resume cover clean distclean open

all: $(PDFS)

cv:        $(OUT_DIR)/cv.pdf
abstract:  $(OUT_DIR)/abstract.pdf
resume:    $(OUT_DIR)/resume.pdf
cover:     $(OUT_DIR)/cover.pdf

open: $(OUT_DIR)/resume.pdf
	open "$(OUT_DIR)/resume.pdf"

$(OUT_DIR)/%.pdf: $(SRC_DIR)/%.tex
	@mkdir -p "$(OUT_DIR)"
	@echo "==> Building $*"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "$*.tex"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "$*.tex"
	@echo "==> Wrote $(OUT_DIR)/$*.pdf"

clean:
	@echo "==> Cleaning aux/log files from $(OUT_DIR)"
	@rm -f $(OUT_DIR)/*.aux \
	       $(OUT_DIR)/*.log \
	       $(OUT_DIR)/*.out \
	       $(OUT_DIR)/*.toc \
	       $(OUT_DIR)/*.synctex.gz \
	       $(OUT_DIR)/*.nav \
	       $(OUT_DIR)/*.snm \
	       $(OUT_DIR)/*.fls \
	       $(OUT_DIR)/*.fdb_latexmk

distclean: clean
	@echo "==> Removing PDFs from $(OUT_DIR)"
	@rm -f $(OUT_DIR)/*.pdf