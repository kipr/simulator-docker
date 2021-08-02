FROM emscripten/emsdk

RUN npm install -g yarn

ADD . /app

WORKDIR /app/libwallaby
RUN mkdir build
WORKDIR /app/libwallaby/build
RUN emcmake cmake -Demscripten=ON -Dno_wallaby=ON -Dwith_vision_support=OFF -Dbuild_python=OFF -DBUILD_DOCUMENTATION=OFF .. && make -j2


WORKDIR /app
ENV LIBWALLABY_ROOT=/app/libwallaby
EXPOSE 3000
WORKDIR /app/simulator
RUN yarn install --cache-folder ./.yarncache && yarn build; true
CMD node express.js
