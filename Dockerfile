FROM ubuntu:latest as builder
COPY miniconda-installer.sh /
RUN  bash miniconda-installer.sh -b -p /miniconda3

FROM ubuntu:latest 
COPY --from=builder /miniconda3 /miniconda3
COPY entrypoint.sh /
RUN  groupadd qiskit && \
     useradd -m qiskit -g qiskit && \
     chmod 777 entrypoint.sh  && \
     mkdir -p /notebooks && \
     chown qiskit:qiskit /notebooks && \
     PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin::/miniconda3/bin && \
     conda install -c conda-forge nodejs git
VOLUME [/notebooks]
USER qiskit
WORKDIR /home/qiskit
SHELL ["/bin/bash", "-c"]
RUN PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin::/miniconda3/bin:/home/qiskit/.local/bin && \
    pip3 install --no-cache-dir --compile \
         jupyterlab \
         jupyterlab-lsp \
         jupyterlab-drawio \
         lckr-jupyterlab-variableinspector \
         jupyterlab-code-formatter \
         jupyterlab-system-monitor \
         jupyterlab-git \
         jupyterlab-spreadsheet-editor \
         qiskit[visualization,machine-learning,finance,nature,optimization] \
    && \
    jupyter labextension install \
            jupyterlab-spreadsheet \
            jupyterlab-topbar-extension \
            jupyterlab-plotly
EXPOSE 8888/tcp
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
