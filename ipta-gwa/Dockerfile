FROM continuumio/miniconda3:4.5.4

# install build tools and LAPACK
RUN apt-get -y update && \
    apt-get -y install gcc g++ gfortran make autoconf automake libtool libgl1 && \
    apt-get -y install liblapack3 && \
    apt-get clean

# install a few other basic tools
RUN apt-get -y install less gawk vim && \
    apt-get clean

# install calceph (needed for tempo2...)
RUN wget --no-check-certificate -q https://www.imcce.fr/content/medias/recherche/equipes/asd/calceph/calceph-2.3.2.tar.gz && \
    tar zxvf calceph-2.3.2.tar.gz && \
    cd calceph-2.3.2 && \
    ./configure --prefix=/usr/local && \
    make && make install && \
    cd .. && rm -rf calceph-2.3.2 calceph-2.3.2.tar.gz

ENV LD_LIBRARY_PATH="/usr/local/lib"

# install enterprise and its deps
#RUN conda update -y conda
RUN conda install -y python==3.6
RUN conda install -y \
      numpy scipy matplotlib Cython basemap \
      pandas astropy jupyter notebook ephem \
      mpi4py h5py suitesparse 

RUN conda install -y -c conda-forge healpy awscli
RUN conda update -y conda && conda clean -a

RUN pip install jplephem scikit-sparse corner memory_profiler line_profiler

RUN pip install libstempo --install-option="--force-tempo2-install" && \
    pip install git+https://github.com/dfm/acor@master && \
    pip install git+https://github.com/jellis18/PTMCMCSampler@master && \
    pip install git+https://github.com/nanograv/PINT@master && \
    pip install git+https://github.com/nanograv/enterprise@master && \
    pip install git+https://github.com/nanograv/enterprise_extensions@master

ENV MKL_NUM_THREADS=4

RUN mkdir -p /home/ipta-gwa/
WORKDIR /home/ipta-gwa

# script to run on startup
# copy other stuff into env in this way
COPY run.sh /home/ipta-gwa/
COPY gwb_analysis.py /home/ipta-gwa/
COPY sample_utils.py /home/ipta-gwa/

