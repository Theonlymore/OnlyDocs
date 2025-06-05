FROM python:3.11-slim AS build
WORKDIR /app
COPY . .
RUN pip install mkdocs-material && mkdocs build --clean

FROM nginx:alpine
COPY --from=build /app/site /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
