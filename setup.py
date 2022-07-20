from setuptools import setup
from setuptools import find_packages

setup(
    name="action",
    version="0.0.1",
    package_dir={"": "src"},
    install_requires=["pytest==7.1.2"],
    find_packages=find_packages(
        where='src'
    ),
    classifiers=[
        'Framework :: FastAPI',
        'Intended Audience :: Developers',
        'Intended Audience :: System Administrators',
        'Operating System :: MacOS :: MacOS X',
        'Operating System :: POSIX',
        'Topic :: Software Development',
        'Programming Language :: Python :: 3.8',
        "Natural Language :: English",
        "License :: OSI Approved :: Apache Software License",
        'Topic :: Search',
        'Topic :: SaaS'

    ]
)

