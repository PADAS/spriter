FROM node:alpine
WORKDIR /spriter
COPY package.json ./
RUN npm i -g chokidar-cli
RUN npm i
COPY generate_sprites.sh config.json ./
RUN chmod +x ./generate_sprites.sh

CMD chokidar ${SOURCE_DIR}/**/*.svg -c ./generate_sprites.sh --initial=true