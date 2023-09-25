SRC_FONTS  := $(wildcard src/*.font.txt)
SRC_CHARS  := $(patsubst src/%.font.txt,src/%.chars.txt,$(SRC_FONTS))
TTFS       := $(patsubst src/%.font.txt,dist/ttf/%.ttf,$(SRC_FONTS))
BDFS       := $(patsubst src/%.font.txt,dist/bdf/%.bdf,$(SRC_FONTS))
SFDS       := $(patsubst src/%.font.txt,dist/sfd/%.sfd,$(SRC_FONTS))

BDFBDF                 := ~/git/dse.d/perl-font-bitmap/bin/bdfbdf
BDFBDF_OPTIONS         := --guess --resolution-x=66 --resolution-y=61
BITMAPFONT2TTF         := ~/git/dse.d/bitmapfont2ttf/bin/bitmapfont2ttf
BITMAPFONT2TTF_OPTIONS := --dot-width 0.833333 --dot-height 0.833333 --fill-bounding-box-width

TARGETS := $(BDFS) $(TTFS) $(SFDS)

default:
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

clean:
	/bin/rm $(BDFS) $(TTFS) */*.tmp.* >/dev/null 2>/dev/null || true
