FROM --platform=linux/x86_64 nginx:stable
#デフォルトのnginxファイルを削除して作成したものコンテナ内にコピー
RUN rm -f /etc/nginx/conf.d/*
#自分のapp名.confを記述
COPY nginx.conf /etc/nginx/conf.d/cat-img-api.conf
#-c以降の設定ファイルを指定して起動 daemon offでフォアグラウンドで起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
