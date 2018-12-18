import sys
import setuptools


with open("README.md", "r") as fh:
    long_description = fh.read()


package_dir = {"": "src"}


if any(arg.startswith("bdist") for arg in sys.argv):
    import lib3to6

    package_dir = lib3to6.fix(package_dir)


setuptools.setup(
    name="pampy",
    version="0.1.10",
    author="Claudio Santini",
    author_email="hireclaudio@gmail.com",
    description="The Pattern Matching for Python you always dreamed of",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/santinic/pampy",
    packages=["pampy"],
    package_dir=package_dir,
    platforms='any',
    install_requires=["six", "typing"],
    classifiers=[
        "Programming Language :: Python :: 2",
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
