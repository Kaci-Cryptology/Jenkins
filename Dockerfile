FROM nginx:latest
RUN sed -i 's/nginx/Kaci_le_maitre/g' /usr/share/nginx/html/index.html
EXPOSE 80
