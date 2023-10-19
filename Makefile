install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python3 -m pytest -vvv --cov=hello --cov=greeting\
		--cov=smath --cov=web tests
	python3 -m pytest --bval notebook.ipynb #tests our jupiter notebook
	#python3 -m pytest -v tests /test_web.py # if you just want to test web


debug: 
	python3 -m pytest --v --pdb #Debugger is invoked

one-test:
	python3 -m pytest -vv tests/test_greeting.py::test_my_name4

debugthree: 
	#not working the way I expect
	python3 -m pytest -vv --pdb --maxfail=4 # drop the PDB for the first three failures

format:
	black *.py

lint:
	pylint --disable=R,C *.py

all: install lint test format

