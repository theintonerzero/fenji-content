# Fenji's English: the style guide

This is how Fenji's English for Swords of Legends Online is written, by the agents that translate it, the agents that review it, and anyone who later corrects a line. It holds no text from the game: every example here is invented.

The game's English was its players' most common complaint. Fenji's English is translated afresh from the Chinese, line by line, and reads as if it had been written in English.

## 1. The voice comes from the Chinese

Read who speaks, to whom, and how, and write what that speaker would say in English.

- **Formal, classical speech** becomes formal, slightly old-fashioned English: full forms, a measured rhythm, courtesy. Never "thee and thou", "doth" or "forsooth".
  - `晚辈初到贵地，若有失礼之处，还望前辈海涵。` → `I am new to these parts, honored elder. If I have given any offense, I hope you will forgive me.`
- **Casual speech** becomes casual English, with contractions and the speaker's own turns of phrase.
  - `哎呀，又下雨了，今天的鱼肯定卖不出去。` → `Oh, come on, rain again? Nobody's buying fish today.`
- **Character.** A pompous official sounds pompous, and a child sounds like a child. A villain's menace is as quiet or as loud as the Chinese makes it. Don't flatten everyone into one polite voice.
- **Idioms.** A Chinese idiom or set phrase becomes natural English that says the same thing. Keep its image only where it reads well in English, and never explain it in the line.
- **Jokes and wordplay** are translated for their effect. A pun that can't survive becomes a different joke that does the same job at the same moment.
- **Poems** are rendered as verse: the same number of lines, a steady rhythm, and an image for each image. Rhyme only where it comes naturally.
  - `孤舟载月过寒江，\n一夜霜华满客裳。` → `A lone boat ferries the moon across the cold river;\nby dawn, the frost lies white on a traveler's clothes.`
- **Narration and descriptions** (quests, items, books) are clear, vivid prose. An item's lore can be atmospheric; its effect is plain and exact.
- **The interface** is plain, short and consistent. Buttons, tabs, window titles and section headers are in Title Case (`Accept Quest`, `Sound Settings`). Options and settings are in sentence case (`Show damage numbers`, `Background music`), as today's English mostly has them, and so are a class's or a feature's short descriptions and messages (`Your bag is full.`).

## 2. American English

- **Spelling** is American: color, armor, honor, defense, center, meter, traveler, jewelry, gray, artifact, and practice and license for both the noun and the verb. The checks refuse British forms.
- **Punctuation** is American:
  - double quotes for speech, and single quotes inside them;
  - periods and commas inside the closing quote;
  - the serial comma (`swords, spears, and bows`);
  - an em dash with no spaces around it for a break (`Wait—did you hear that?`);
  - the one character … for an ellipsis, never three periods.
- **Chinese punctuation** becomes English punctuation, with English spacing:
  - `，。！？：；（）` become their English forms;
  - quotation marks of every kind (`「」`, `『』`, curly ones) become straight double quotes;
  - a title in `《》` becomes the title in Title Case, without the brackets;
  - `……` becomes one `…`.
- **Numbers.** Digits stay digits, with their value. A Chinese number word in prose becomes the English word: `三天` is `three days`, and `第五` is `fifth`. In a game value, it becomes digits.

## 3. Names and terms come from the glossary

- **The glossary's names.** A term whose kind is `name` is written exactly as the glossary has it, capitals included, or as one of its variants. The checks refuse a name written any other way.
- **The glossary's words.** A term whose kind is `word` gives a term's sense and the English for it; it isn't a name. In a sentence it takes ordinary English capitals and grammar: a plural, a verb's form. A tooltip's Healing stat keeps its capital, but healing in a story has none.
- **People's names** are in pinyin, without tone marks: the family name first, then the given name as one word (`Ke Muqing`). The glossary keeps the official English names that are right, and corrects those that aren't.
- **A name the glossary lacks** is written the same way throughout the batch, as the glossary would write it: in pinyin for a person, and by its meaning for a place or thing whose Chinese name describes it.
- **Forms of address and titles** (teacher, elder, sworn brother, sect leader) follow the glossary. Where it has none, choose an English form that keeps the relationship, and keep to it.

## 4. Markup, placeholders, line breaks and numbers stay as they are

The game's text carries markup, which the client reads and players never see. It stays exactly as it is in the Chinese: the same tags, codes, placeholders and line breaks, in an order the markup allows. A tag opens before it closes, and tags nest as they did. The English moves around them as English needs.

- **Placeholders** the game fills in, such as `{0}`, `{1}` and `%s`, stay. Build the sentence around them.
  - `{0}把{1}交给了你。` → `{0} handed you {1}.`
- **Text players see inside markup is translated:** the text between tags, and a tag's text attributes, such as a name, through the glossary. Everything else in a tag (colors, ids, sounds, actions) is copied exactly.
  - `[q_npcname text="柯木青"]说她在桥边等你。` → `[q_npcname text="Ke Muqing"] says she'll wait for you by the bridge.`
  - `请在[c ffcc00]三天[/c]之内回来。` → `Please be back within [c ffcc00]three days[/c].`
- **Codes between pipes,** such as `|cp,1,2|`, are values the game works out. Keep each one exactly, where its number goes.
- **A pair of `#` marks** highlights what's between them. Keep both, around the English for what the Chinese highlights.
  - `对目标造成#|cp,1,2|#点伤害。` → `Deals #|cp,1,2|# damage to the target.`
- **Line breaks** stay, as many as the Chinese has, each where the English reads well. In a batch's JSON, a line break is `\n`.
  - `风起了。\n快把帆收起来。` → `The wind is rising.\nGet the sail down, quick!`
- **Square brackets** around a plain word, such as an item's name or a key, are punctuation. Keep them around the English (`[Iron Sword]`, `[W]`).
- Never add markup the Chinese doesn't have.

## 5. Only characters the game's font draws

The game's English font draws printable ASCII, line breaks and tabs, and a few others:
- the en dash `–`, the em dash `—`, the ellipsis `…` and the middle dot `·`;
- the no-break space, and the degree sign `°`;
- the accented letters of names that have them, such as `é` and `ü`;
- the Roman numerals `Ⅰ` to `Ⅷ`, where the Chinese has them;
- the few symbols the Chinese itself uses, such as `※`, `♪` and `→`, kept where it has them.

Use no other character:
- quotes and apostrophes are straight (`'` and `"`), never curly;
- no other symbols;
- no Chinese.

The checks refuse any other character.

## 6. Length

Where the interface is tight (buttons, tabs, item and skill names, short labels), a line carries a budget. That's the most characters its English may draw, markup not counted, set from today's English. Stay within it:
- use a shorter word;
- leave articles out of a label (`Open Bag`, not `Open the Bag`);
- use a shorter form the glossary gives.

A shorter wording, never a shorter meaning: a label that loses its verb or its object to fit is wrong. `显示友方名字` (show ally names) as `Ally Names` loses what the option does; `Show Allies` keeps it.

Never cut a word short with a period (`Atk.`) unless the glossary does.

## 7. Faithful, not copied

- **Translate what the Chinese says, and how it says it:** nothing added, nothing left out, and nothing explained that the Chinese leaves unsaid.
- **Today's English is context.** It shows how the line was understood, and it's often wrong. Never copy it, and keep its wording only where it's both faithful and good.
- **Keep the world's own feel:** no modern slang or idioms that break it (`OK`, `cool`, `no worries`), unless the speaker is joking or the Chinese is as modern.
- **Say the same thing the same way everywhere:** an effect, an instruction, a recurring phrase.
