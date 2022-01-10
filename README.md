# Docker Qiskit
Builds docker image for Qiskit

All available **Qiskit** application areas are included:
1. Visualization
2. Machine Learning
3. Finance
4. Nature
5. Optimization

The following **Jupyter** externsions are included:
1. LSP - Language Server Protocol
2. Draw.io / Diagrams.net
3. Git
4. Code Formatter
5. Variable Inspector
6. System Monitor
7. Spreadsheet Editor

## How to use

### Docker command line:

```
docker run -p 8888:8888 aldrinebaroi/qiskit
```

### Docker Compose:

```
version: "3"
services:
  qiskit:
    image: aldrinebaroi/qiskit
    ports:
      - 8888:8888
```


Access Jupyter console using the following URL:
```
http://localhost:8888/lab?token=qiskit
```
