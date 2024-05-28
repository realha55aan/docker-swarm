FROM node:latest

RUN corepack enable pnpm
RUN corepack use pnpm@latest

RUN apt-get update && apt-get install -y git
WORKDIR /app/
COPY project.sh /app
RUN chmod +x /app/project.sh
RUN /app/project.sh

WORKDIR /app/ncl-packing-shipping-frontend
RUN pnpm install
RUN pnpm run build

CMD ["npm", "start"]
