CONFIG_NAME="${2:-config.json}"
eval $(npm bin)/svg-sprite -s --config=$CONFIG_NAME $1'/**/*.svg'   

