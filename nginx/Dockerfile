FROM --platform=linux/x86_64 nginx:stable
RUN apt-get update && \
  apt-get install -y apt-utils \
  locales && \
  sed -i -e 's/# ja_JP.UTF-8/ja_JP.UTF-8/g' /etc/locale.gen && \
  locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_TIME C
#デフォルトのnginxファイルを削除して作成したものコンテナ内にコピー
RUN rm -f /etc/nginx/conf.d/*
#自分のapp名.confを記述
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/cat-img-api.conf
#-c以降の設定ファイルを指定して起動 daemon offでフォアグラウンドで起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
