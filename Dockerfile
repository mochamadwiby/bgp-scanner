# Gunakan image Node.js resmi sebagai base image
FROM node:slim

# Set direktori kerja di dalam container
WORKDIR /usr/src/app

# Salin file package.json dan package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Salin seluruh kode aplikasi ke dalam container
COPY . .

# Build kode TypeScript
RUN npm run build

# Install PM2 secara global
RUN npm install -g pm2

# Ekspos port yang digunakan oleh aplikasi
EXPOSE 5500

ENTRYPOINT [ "pm2", "start" ]
CMD [ "ecosystem.config.js", "--no-daemon" ]