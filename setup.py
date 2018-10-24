#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import setup, find_packages

requirements = ['pyyaml' ]

test_requirements = ['pytest', ]

setup(
    author="Archana Asokan",
    author_email='archana.asokan.29@gmail.com',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'Natural Language :: English',
        "Programming Language :: Python :: 2",
        'Programming Language :: Python :: 2.7',
    ],
    description="Dummy Python Package",
    entry_points={
        'console_scripts': [
        ],
    },
    install_requires=requirements,
    long_description='',
    include_package_data=True,
    keywords='dummy_python',
    name='dummy_python',
    packages=find_packages(exclude=['tests*']),
    setup_requires=['setuptools'],
    tests_require=test_requirements,
    url='',
    version='0.1.0',
    zip_safe=False,
)
