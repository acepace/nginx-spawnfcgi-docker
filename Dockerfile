FROM nginx:stable

RUN apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y spawn-fcgi && \
	apt-get install --no-install-recommends --no-install-suggests -y procps  && \
        apt-get purge -y --auto-remove

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

