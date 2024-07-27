FROM public.ecr.aws/lambda/python:3.9

# to install requirements, if requirements are not there this can be removed
COPY requirements.txt ./
RUN pip install -r requirements.txt

# to install playwright on centos in a python image

# need to add playwright directory to env, so  that code can find it
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# install playwright
RUN python3 -m pip install playwright==1.30.0 -U
# install chromium browser binary
RUN python3 -m playwright install chromium

# install dependencies
RUN yum update -y && \
    yum install -y alsa-lib \
    at-spi2-atk  \
    at-spi2-core \
    atk \
    bash \
    cairo \
    cups-libs \
    dbus-libs \
    expat \
    flac-libs \
    gdk-pixbuf2 \
    glib2 \
    glibc \
    gtk3 \
    libX11 \
    libXcomposite \
    libXdamage \
    libXext \
    libXfixes \
    libXrandr \
    libXtst \
    libcanberra-gtk3 \
    libdrm \
    libgcc \
    libstdc++ \
    libxcb \
    libxkbcommon \
    libxshmfence \
    libxslt \
    mesa-libgbm \
    nspr \
    nss \
    nss-util \
    pango \
    policycoreutils \
    policycoreutils-python-utils \
    zlib

# copy source code if required
COPY app/ ./
CMD ["app.main"]
