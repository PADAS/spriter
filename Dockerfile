FROM node:alpine
#RUN mkdir /workspace
ADD . /workspace
WORKDIR /workspace

RUN npm i -g grunt-cli 
#RUN curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
RUN yarn

CMD sh generate_sprites.sh /static config-local.json && cp event-svg-sprite.svg /static/
