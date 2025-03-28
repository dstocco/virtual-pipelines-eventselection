# Dockerfile

# Specify the base image that we're building the image on top of
FROM rootproject/root:6.26.10-conda

WORKDIR /home/analysis

COPY . /home/analysis

RUN COMPILER=$(root-config --cxx) && \
    FLAGS=$(root-config --cflags --libs) && \
    $COMPILER -g -O3 -Wall -Wextra -Wpedantic -o skim skim.cxx $FLAGS

# # Run some bash commands to install packages
# RUN apt-get -y update && \
#     apt-get -y upgrade && \
#     apt-get -y install cowsay && \
#     apt-get -y autoclean && \
#     apt-get -y autoremove && \
#     rm -rf /var/lib/apt-get/lists/* && \
#     ln -s /usr/games/cowsay /usr/bin/cowsay
# RUN pip install --no-cache-dir -q scikit-learn

# This sets the default working directory when a container is launched from the image
WORKDIR /home/analysis

CMD ["/bin/bash"]
