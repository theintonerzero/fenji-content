# fenji-content

The content [Fenji](https://github.com/theintonerzero/fenji) ships to change Swords of Legends Online, for players of their own copies of the game. Its first part is a new English translation of the game's text, made from the Chinese.

## What's here

- **`text/en/`**: the new English. Each line is the fingerprint of one of the game's lines, a tab, and its English. A fingerprint is the first 16 bytes of the SHA-256 of the line's Chinese, in hex: it identifies the line without holding it. The files are split by area (interface, quests, dialogue and so on), and sorted by fingerprint.
- **`glossary.tsv`**: every name and recurring term, as the translation writes it, with a note.
- **`STYLE.md`**: how the English is written.
- **`NOTICE.md`**: what these files are, and whose text they translate.

No Chinese, none of the game's own English, and none of the game's files are in this repository.

## How players get it

Fenji's launcher downloads the latest release, checks its signature, and applies it to the player's own copy. A line the release doesn't have keeps the game's own English. The launcher's settings have a switch to turn it off.

## Reporting a wrong line

Open an issue. Say where the line shows (a quest, a window, an item or a skill), what it says now, and what's wrong with it. A screenshot helps. Please don't paste long passages of the game's text.

## Releases

Each release is a tag (`v1.0.0`). Its workflow builds the pack, `fenji-content-<version>.tar.gz`, from this repository with `scripts/pack.sh`, and signs it with Fenji's content key behind the maintainer's approval. The launcher checks that signature before it uses a pack.
