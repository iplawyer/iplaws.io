FROM golang
WORKDIR /opt/hugo
ENV HUGO_VERSION 0.51
ENV HUGO_BIN_NAME hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV HUGO_BIN_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BIN_NAME}
RUN wget -qO- "${HUGO_BIN_URL}" | tar xz
ENV PATH "/opt/hugo:${PATH}"
COPY . /opt/hugo/
CMD ["hugo", "server", "--baseURL", "iplaws.io", "--bind", "0.0.0.0", "--appendPort=false"]