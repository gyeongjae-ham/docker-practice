FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci
# npm install 보다 ci가 더 좋다 install의 경우 package 버전 이후 버전 중 최신 버전을 설치하지만
# npm ci는 package-lock.json에 명시되어 있는 버전을 설치한다!! 버전이 달라질 일이 없다

COPY index.js .

ENTRYPOINT ["node", "index.js"]
#  Dockerfile은 Layer 형태를 가지고 있으므로 제일 빈번하게 발생하는 파일일수록 제일 마지막에 위치해야 한다
#  변경되지 않은 Layer는 캐시된 Layer를 재사용하기 때문이다
