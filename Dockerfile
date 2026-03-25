# Etapa 1: Compilar el frontend (React/Vue/CSS) usando Node.js
FROM node:18-alpine as build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci || npm install
COPY . .
RUN npm run build

# Etapa 2: Construir el servidor PHP con Apache
FROM php:8.1-apache
WORKDIR /var/www/html

# Instalar dependencias del sistema y extensiones de PHP requeridas por Laravel
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    curl \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Habilitar el módulo mod_rewrite de Apache (necesario para las rutas de Laravel)
RUN a2enmod rewrite

# Configurar el DocumentRoot de Apache para que apunte a la carpeta 'public' de Laravel
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar el código del proyecto al contenedor
COPY . .

# Copiar los archivos compilados del frontend desde la Etapa 1
COPY --from=build /app/public/build ./public/build

# Instalar dependencias de PHP para producción
RUN composer install --no-dev --optimize-autoloader

# Configurar permisos importantes de Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80
