FROM mcr.microsoft.com/azureml/openmpi4.1.0-cuda11.8-cudnn8-ubuntu22.04:20240712.v1

WORKDIR /

ENV CONDA_PREFIX=/azureml-envs/tensorflow-2.16-cuda11
ENV CONDA_DEFAULT_ENV=$CONDA_PREFIX
ENV PATH=$CONDA_PREFIX/bin:$PATH

# Create conda environment
COPY conda_dependencies.yml .
RUN conda env create -p $CONDA_PREFIX -f conda_dependencies.yml -q && \
    rm conda_dependencies.yml && \
    conda run -p $CONDA_PREFIX pip cache purge && \
    conda clean -a -y

RUN conda run -p $CONDA_PREFIX
                          
# This is needed for mpi to locate libpython
ENV LD_LIBRARY_PATH $AZUREML_CONDA_ENVIRONMENT_PATH/lib:$LD_LIBRARY_PATH
RUN echo "nameserver 8.8.8.8" | tee /etc/resolv.conf > /dev/null
RUN apt-get install -y apt-transport-https ca-certificates libffi7
RUN apt-get update

RUN apt-get install -y bwa samtools

# Use precompiled binaries (recommended)
RUN curl -L https://github.com/bwa-mem2/bwa-mem2/releases/download/v2.0pre2/bwa-mem2-2.0pre2_x64-linux.tar.bz2 \
  | tar jxf -

#RUN ln -s bwa-mem2-2.0pre2_x64-linux/bwa-mem2 /usr/bin/bwa-mem2
# usage:
# bwa-mem2 index ref.fa
# bwa-mem2 mem ref.fa read1.fq read2.fq > out.sam