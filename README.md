# Data-Science-Notebook

Intended for data science, this Docker image consists of iPython Notebook & Terminal, with a full Anaconda installation and several additional packages.

## Usage

- Build the container: `docker build -t dnc1994/dsnb .`

- Run the container: `docker run -p 8888:8888 -i -t -e PASSWORD=<your password> dnc1994/dsnb`

- Access `<docker host ip:8888>` and log in using the pasword you set.

## Acknowledgements

- [rothnic/anaconda-notebook](https://github.com/rothnic/anaconda-notebook)
- [DaoCloud/python-ipython-notebook](https://github.com/DaoCloud/python-ipython-notebook)

## Author
[Linghao Zhang](https://github.com/dnc1994)

## License
[MIT license](https://github.com/dnc1994/Data-Science-Notebook/blob/master/LICENSE)
