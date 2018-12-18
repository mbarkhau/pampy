PY36_ENV = $(HOME)/miniconda3/envs/pampy36
PY27_ENV = $(HOME)/miniconda3/envs/pampy27


COMPAT_TEST_FILES = $(shell ls -1 tests/*.py | awk '{ printf " compat_"$$0 }')

compat_tests/%.py: tests/%.py
	@mkdir -p compat_tests/;
	$(PY36_ENV)/bin/lib3to6 $< > $@.tmp;
	mv $@.tmp $@;


.PHONY: test
test: $(COMPAT_TEST_FILES)
	rm -f dist/*.whl
	$(PY36_ENV)/bin/python setup.py bdist_wheel;

	$(PY36_ENV)/bin/python -m pip install dist/*.whl
	$(PY36_ENV)/bin/python -m unittest discover -s compat_tests/

	$(PY27_ENV)/bin/python -m pip install dist/*.whl
	$(PY27_ENV)/bin/python -m unittest discover -s compat_tests/
