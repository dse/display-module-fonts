# Display Module Fonts

Fonts to replicate LCD character displays driven by HD44780 or
compatible ICs, which appear to be the vast majority of them.

All characters are in their proper Unicode codepoints, whereas in the
IC controllers there's a character or two in non-standard character
code positions.

In addition to printable ASCII (0x20–0x7e), each font has the
following characters:

-   U+2588 FULL BLOCK - useful as a backing layer or cursor.
-   U+2192 RIGHTWARDS ARROW - included in code 0x7e, in lieu of tilde.
-   U+2190 LEFTWARDS ARROW - included in code 0x7f.

All fonts also include U+007E TILDE, whereas only one of the ICs had
one.

## Variants

There are three slightly different variations:

-   Display Module 1 - original HD44780
-   Display Module 2 - HD44780U, rom code A00 - The HD44780U is used for most displays available for sale now.
-   Display Module 3 - HD44780U, rom code A02

## Formats

Fonts are available in TrueType and BDF, though the BDFs are intended
more as an intermediary format.

## Sources

Data sheets are available for the
[original](./src/data-sheets/hd44780-1985.pdf) and
[current](./src/data-sheets/hd44780u-1998.pdf) controller chips.
Fonts vary slightly.

## Copyright & License

Copyright (c) 2023, Darren Embry (dsembry@gmail.com).

This Font Software is licensed under the SIL Open Font License,
Version 1.1.

This license is copied [as LICENSE.md](./LICENSE.md), and is also
available with a FAQ at:
[https://scripts.sil.org/OFL](https://scripts.sil.org/OFL).
