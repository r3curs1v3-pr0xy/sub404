FROM python:3.8

ARG SUBFINDER_VERSION="2.4.5"

RUN wget "https://github.com/projectdiscovery/subfinder/releases/download/v${SUBFINDER_VERSION}/subfinder_${SUBFINDER_VERSION}_linux_amd64.tar.gz"
RUN tar -xzvf subfinder_${SUBFINDER_VERSION}_linux_amd64.tar.gz
RUN mv subfinder /usr/local/bin/
RUN rm LICENSE.md README.md subfinder_${SUBFINDER_VERSION}_linux_amd64.tar.gz

RUN pip install git+https://github.com/aboul3la/Sublist3r.git

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY sub404.py .

ENTRYPOINT [ "python3", "./sub404.py" ]