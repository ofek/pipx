.PHONY: build publish docs test


test:
	python setup.py test

build: clean
	python -m pip install --upgrade --quiet setuptools wheel twine
	python setup.py --quiet sdist bdist_wheel

publish: build
	python -m twine upload dist/*

clean:
	rm -r build dist *.egg-info || true

docs:
	python generate_readme.py
