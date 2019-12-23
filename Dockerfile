FROM node:11.15

# Initial update
RUN apt-get clean && apt-get update

# Container deps
RUN apt-get install -y aptitude
RUN aptitude install -y git libmcrypt-dev libpq-dev libcurl4-gnutls-dev libcurl4-openssl-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev

# Install NodeJS
RUN aptitude update && aptitude install -y wget gnupg
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# Install GCP
RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk-stretch main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
RUN aptitude update && aptitude install -y google-cloud-sdk