ENGINE   := xelatex
SRC_DIR  := src
OUT_DIR  := output

DOCS     := cv abstract resume cover
PDFS     := $(DOCS:%=$(OUT_DIR)/%.pdf)

CONTENT_TEX := $(wildcard content/*.tex) \
               $(wildcard content/summary/*.tex) \
               $(wildcard content/exerience/*.tex) \
               $(wildcard content/education/*.tex) \
               $(wildcard content/publication/*.tex)

STYLE_FILES := $(wildcard styles/*.cls) \
               $(wildcard styles/*.sty)

SRC_FILES := $(wildcard src/*.tex)

COMMON_DEPS := $(CONTENT_TEX) $(STYLE_FILES)

XELATEX_FLAGS := -synctex=1 -interaction=nonstopmode -file-line-error \
                 -output-directory=../$(OUT_DIR)

.PHONY: all cv abstract resume cover clean distclean open

all: $(PDFS)

cv: $(OUT_DIR)/cv.pdf
abstract: $(OUT_DIR)/abstract.pdf
resume: $(OUT_DIR)/resume.pdf
cover: $(OUT_DIR)/cover.pdf

open: $(OUT_DIR)/resume.pdf
	open "$(OUT_DIR)/resume.pdf"

$(OUT_DIR)/cv.pdf: $(SRC_DIR)/cv.tex $(COMMON_DEPS)
	@mkdir -p "$(OUT_DIR)"
	@echo "==> Building cv"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "cv.tex"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "cv.tex"
	@echo "==> Wrote $(OUT_DIR)/cv.pdf"

$(OUT_DIR)/resume.pdf: $(SRC_DIR)/resume.tex $(COMMON_DEPS)
	@mkdir -p "$(OUT_DIR)"
	@echo "==> Building resume"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "resume.tex"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "resume.tex"
	@echo "==> Wrote $(OUT_DIR)/resume.pdf"

$(OUT_DIR)/abstract.pdf: $(SRC_DIR)/abstract.tex $(COMMON_DEPS)
	@mkdir -p "$(OUT_DIR)"
	@echo "==> Building abstract"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "abstract.tex"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "abstract.tex"
	@echo "==> Wrote $(OUT_DIR)/abstract.pdf"

$(OUT_DIR)/cover.pdf: $(SRC_DIR)/cover.tex $(COMMON_DEPS)
	@mkdir -p "$(OUT_DIR)"
	@echo "==> Building cover"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "cover.tex"
	@cd "$(SRC_DIR)" && $(ENGINE) $(XELATEX_FLAGS) "cover.tex"
	@echo "==> Wrote $(OUT_DIR)/cover.pdf"

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