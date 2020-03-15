setup:
	python3 -m venv ~/cmdockerproject
	
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbva1 notebook.ipynb
	
validate-circleci:
	# see https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml
	
run-circle-local:
	# see https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute
	
	
lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py
	
all: install lint test