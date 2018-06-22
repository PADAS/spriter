# DAS Spriter

This is a tiny project which runs [svg-sprite](https://github.com/jkphl/svg-sprite) with a certain configuration in service of creating SVG sprites for DAS.
To run, simple execute `sh generate_sprites.sh $inputDirectory` where `$inputDirectory` equals the directory containing your SVG collection. For example:

```
sh generate_sprites.sh ~/Desktop/illustrator-exports
``` 

This will create a sprite or series of sprites based on `config.json` and place them in their configured destination (currently `output` directory within this project folder).

The output file is a `<symbol>`-based sprite sheet. 

To use the sprite sheet in your project, include the svg sprite inline in your HTML and then reference the individual sprite members using the `<use>` element.
The ID of the sprite image you're targeting will equal the filename of your individual svg file.

For example, if I have a directory `~/Desktop/illustrator-exports/cool-sprites` containing the following files:
- nice_icon.svg
- totally_cool_icon.svg

I would first run `sh generate_sprites.sh ~/Desktop/illustrator-exports/cool-sprites`, inline the output SVG code into my project, and then reference individual members of the sprite sheet as such:
```
<svg>
    <use href="#totally_cool_icon" />
</svg>
```
```
<svg>
    <use href="#nice_icon" />
</svg>
```