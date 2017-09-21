FROM python:3-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TESTDEPS="bitstring pytest setuptools wheel virtualenv"

RUN \
  apt-get update && \
  apt-get install -qy --no-install-recommends git

COPY ./ /faucet-src/

RUN \
  pip3 --no-cache-dir install --upgrade pip && \
  pip3 --no-cache-dir install $TESTDEPS --upgrade && \
  pip3 --no-cache-dir install -r /faucet-src/requirements.txt && \
  pip3 --no-cache-dir install /faucet-src && \
  python3 -m pytest /faucet-src/tests/test_valve.py

VOLUME ["/etc/ryu/faucet/", "/var/log/ryu/faucet/"]

EXPOSE 6653 9302

CMD ["ryu-manager", "faucet.faucet"]
