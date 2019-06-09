FROM linuxserver/transmission

ARG pip_installer="https://bootstrap.pypa.io/get-pip.py"
ARG awscli_version="1.16.152"

RUN apk add build-base python-dev
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python
RUN pip install awscli==${awscli_version}
RUN pip install --user --upgrade aws-sam-cli

RUN mkdir /data
RUN chmod -x /data

ENV PATH $PATH:/root/.local/bin

COPY config/settings.json /config/settings.json
COPY scripts/ /scripts/

RUN echo '* * * * * sh /scripts/copy_torrent_files_from_s3_and_move_origin.sh' >> /var/spool/cron/crontabs/root
