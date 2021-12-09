ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/minimal-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Rohit Rawat"

USER root

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install make

USER ${NB_UID}

# Install Python 3 packages
RUN conda install --quiet --yes \
    'docopt=0.6.*' \
    'nltk=3.6*' \