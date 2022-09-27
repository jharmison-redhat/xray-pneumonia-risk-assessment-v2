FROM registry.access.redhat.com/ubi9/python-39:1-74

USER 0

COPY data/chest_xray /data/chest_xray
COPY requirements.txt /app/requirements.txt

RUN /opt/app-root/bin/python3 -m pip install -r /app/requirements.txt

COPY training.py /app/training.py

VOLUME /model
WORKDIR /data

ENTRYPOINT ["/opt/app-root/bin/python3"]
CMD ["/app/training.py"]
