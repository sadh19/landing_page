FROM nginx:alpine

COPY dist/landing_page/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]