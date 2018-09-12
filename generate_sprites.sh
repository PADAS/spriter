#!/bin/sh

eval $(npm bin)/svg-sprite -s --config=config.json --ss=../${SPRITE_NAME} --dest=$DEST_DIR ${SOURCE_DIR}/**/*.svg