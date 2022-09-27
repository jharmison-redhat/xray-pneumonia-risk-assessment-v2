FROM registry.access.redhat.com/ubi9/python-39:1-74

WORKDIR /usr/src/app

COPY requirements.txt risk-assessment.py pneumonia_model.h5 FreeMono.ttf ./

RUN pip install -r requirements.txt

CMD ["python", "-u", "risk-assessment.py"]
