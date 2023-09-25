# Display Module Fonts

Fonts to replicate LCD character displays, most of which are driven by
HD44780 or compatible ICs.

All characters are in their proper Unicode codepoints, whereas in the
IC controllers there's a character or two in non-standard character
code positions.

In addition to printable ASCII, each font has the following
characters:

-   U+2588 FULL BLOCK - useful as a backing layer or cursor.
-   U+2192 RIGHTWARDS ARROW - included in code 0x7E, in lieu of tilde.
-   U+2190 LEFTWARDS ARROW - included in code 0x7F.

All fonts also include U+007E TILDE.  One of the variants had one.

## Variants

There are three slightly different variations:

-   Display Module 1 - original HD44780
-   Display Module 2 - HD44780U, rom code A00 - The HD44780U is used for most displays available for sale now.
-   Display Module 3 - HD44780U, rom code A02

## Copyright & License

Copyright (c) 2023, Darren Embry (dsembry@gmail.com).

This Font Software is licensed under the SIL Open Font License,
Version 1.1.

This license is copied [as LICENSE.md](./LICENSE.md), and is also
available with a FAQ at:
[https://scripts.sil.org/OFL](https://scripts.sil.org/OFL).
