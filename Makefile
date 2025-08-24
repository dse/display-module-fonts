SRC_FONTS  := $(wildcard src/bitmap/*.font.txt)
SRC_CHARS  := $(patsubst src/bitmap/%.font.txt,src/bitmap/%.chars.txt,$(SRC_FONTS))
TTFS       := $(patsubst src/bitmap/%.font.txt,dist/ttf/%.ttf,$(SRC_FONTS))
BDFS       := $(patsubst src/bitmap/%.font.txt,dist/bdf/%.bdf,$(SRC_FONTS))
SFDS       := $(patsubst src/bitmap/%.font.txt,dist/sfd/%.sfd,$(SRC_FONTS))

BDFBDF                 := ~/git/dse.d/perl-font-bdf/bin/bdf2bdf
BDFBDF_OPTIONS         := --resolution-x=66 --resolution-y=61
BITMAPFONT2TTF         := ~/git/dse.d/bitmapfont2ttf/bin/bitmapfont2ttf
BITMAPFONT2TTF_OPTIONS := --dot-width 0.833333 --dot-height 0.833333 --bdf-ascent-descent # --fill-bounding-box-width

TARGETS := $(BDFS) $(TTFS) $(SFDS)

default: ttf bdf sfd

help: FORCE
	@echo "make ttf"
	@echo "make sfd"
	@echo "make bdf"
	@echo "make clean"

ttf: $(TTFS)
bdf: $(BDFS)
sfd: $(SFDS)

dist/ttf/%.ttf: dist/bdf/%.bdf Makefile
	mkdir -p dist/ttf || true
	$(BITMAPFONT2TTF) $(BITMAPFONT2TTF_OPTIONS) $< $@.tmp.ttf
	mv $@.tmp.ttf $@

dist/bdf/%.bdf: src/%.font.txt src/%.chars.txt Makefile
	mkdir -p dist/bdf || true
	$(BDFBDF) $(BDFBDF_OPTIONS) $< > $@.tmp.bdf
	mv $@.tmp.bdf $@

dist/sfd/%.sfd: dist/bdf/%.bdf Makefile
	mkdir -p sfd || true
	$(BITMAPFONT2TTF) $(BITMAPFONT2TTF_OPTIONS) $< $@.tmp.sfd
	mv $@.tmp.sfd $@

clean: FORCE
	/bin/rm $(SFDS) $(BDFS) $(TTFS) */*.tmp.* >/dev/null 2>/dev/null || true

.PHONY: FORCE
