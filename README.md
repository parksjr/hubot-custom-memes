# hubot-custom-memes

A hubot script for generating custom memes with special commands
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/41fce71444f54a06a31ac7ca053ab380)](https://www.codacy.com/app/mike_10/hubot-custom-memes?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=parksjr/hubot-custom-memes&amp;utm_campaign=Badge_Grade)

See [`src/custom-memes.coffee`](src/custom-memes.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-custom-memes --save`

Then add **hubot-custom-memes** to your `external-scripts.json`:

```json
[
  "hubot-custom-memes"
]
```

## Sample Interaction

```
user1>> hubot meme list
hubot>> tenguy - 10 Guy
				afraid - Afraid to Ask Andy
				aag - Ancient Aliens Guy
				biw - Baby Insanity Wolf
				...
```

```
user1>> hubot meme kermit " " "but that's none of my business"
hubot>> http://memegen.link/kermit/-/but-that%27s-none-of-my-business.jpg
```
