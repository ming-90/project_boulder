PYTHON=3.8
BASENAME=$(shell basename $(CURDIR))
CONDA_CH=conda-forge defaults

env:
	conda create -n $(BASENAME) -y python=$(PYTHON) $(addprefix -c ,$(CONDA_CH))

setup:
	pip install -r requirements.txt