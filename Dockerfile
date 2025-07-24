# 使用官方 Node.js 镜像作为构建环境
FROM node:14 as build-stage

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 并安装依赖
COPY package*.json ./
RUN npm install

# 复制应用代码并构建
COPY . .
RUN npm run build

# 使用 Nginx 来运行构建后的静态文件
FROM nginx:alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html

# 可选：暴露端口80
EXPOSE 80