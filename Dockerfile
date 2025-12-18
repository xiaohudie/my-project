# ==========================================
# Vue 项目 Docker 部署配置
# CI 流程中已经完成了 yarn build 打包
# 这里直接使用打包好的 dist 目录
# ==========================================

# 使用 Nginx 作为 Web 服务器
FROM nginx:alpine

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 删除 Nginx 默认页面
RUN rm -rf ./*

# 复制打包好的 dist 目录到 Nginx 网站根目录
# 注意：CI 流程中已经把 public 目录的内容复制到 dist 了
COPY dist/ .

# 复制 Nginx 配置文件（支持 Vue Router history 模式）
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露 80 端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]