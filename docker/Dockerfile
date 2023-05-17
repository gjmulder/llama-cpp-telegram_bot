FROM nvidia/cuda:12.1.1-devel-ubuntu20.04

# Install the deps
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/GMT
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip git cmake

# Get llama-cpp-python
WORKDIR /usr/src
RUN git clone https://github.com/abetlen/llama-cpp-python.git 
#RUN git clone https://github.com/gjmulder/llama-cpp-python.git
WORKDIR /usr/src/llama-cpp-python

# Patch .gitmodules to use HTTPS
RUN sed -i 's|git@github.com:ggerganov/llama.cpp.git|https://github.com/ggerganov/llama.cpp.git|' .gitmodules
RUN git submodule update --init --recursive

# Build llama-cpp-python w/CuBLAS
RUN pip install scikit-build fastapi sse_starlette uvicorn && LLAMA_CUBLAS=1 python3 setup.py install --verbose

# 

# We need to set the host to 0.0.0.0 to allow outside access
ENV HOST 0.0.0.0

# Run the server
#CMD python3 -m llama_cpp.server
CMD bash -c "ulimit -l unlimited && python3 -m llama_cpp.server"
