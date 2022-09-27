FROM registry.fedoraproject.org/fedora:36

RUN dnf -y install python3-pip && dnf clean all

COPY requirements.txt /app/requirements.txt

RUN python3 -m pip install -r /app/requirements.txt

COPY training.py /app/training.py

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/usr/bin/python3"]
CMD ["/app/training.py"]
