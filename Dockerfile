FROM ubuntu:16.04@sha256:f4c51ba054967fd4b06715f1b67078efbe9ca152e8be98d8f3c1f4d08c6042f8

ENV DEBIAN_FRONTEND noninteractive
ENV EXPORTER_BASEDIR /opt/libvirt_exporter/

RUN mkdir ${EXPORTER_BASEDIR}

RUN apt-get update && apt-get install -y libvirt-dev curl git gcc python3 \
    python3-pip && apt-get clean all


# RUN apt-get update && apt-get install -y libvirt-bin && apt-get clean all
ADD requirements.txt libvirt_exporter.py ${EXPORTER_BASEDIR}/
WORKDIR ${EXPORTER_BASEDIR}
RUN pip3 install -r requirements.txt

CMD [ "python3", "./libvirt_exporter.py" ]
