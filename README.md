# DAS Spriter

This project runs [svg-sprite](https://github.com/svg-sprite/svg-sprite) with a shared configuration to build `<symbol>`-based SVG sprites for DAS.

## Prerequisites

- [Bun](https://bun.sh) (see `packageManager` in `package.json` for the version this repo is pinned to)

## Setup

```sh
bun install
```

## Generate sprites

From this directory, pass the folder that contains your SVG files. Optionally pass a config file as the second argument (default: `config.json`).

```sh
bun run generate -- /path/to/your/svg-folder
bun run generate -- /path/to/your/svg-folder config-k8.json
```

A legacy shell entrypoint is still available (runs the same Bun script):

```sh
sh generate_sprites.sh ~/Desktop/illustrator-exports
```

Output paths and sprite filename come from the chosen config (for example `config.json`, `config-local.json`, or `config-k8.json`).

### Using the sprite sheet

Include the generated SVG sprite inline in your HTML and reference members with `<use>`. The symbol `id` matches each source file’s basename (without `.svg`).

Example for files `nice_icon.svg` and `totally_cool_icon.svg`:

```html
<svg>
  <use href="#totally_cool_icon" />
</svg>
```

```html
<svg>
  <use href="#nice_icon" />
</svg>
```

## SVGO options

Sprite configs use svg-sprite 2’s SVGO integration: `shape.transform[].svgo.plugins` follows [SVGO 2’s plugin list](https://github.com/svg/svgo) (`preset-default` plus explicit `removeStyleElement` and `removeAttrs` to match the previous DAS behavior).
