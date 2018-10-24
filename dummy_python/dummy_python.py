# -*- coding: utf-8 -*-
"""Main module."""

import yaml
import logging
import logging.config

LOGGING_CONFIG = 'logging.yaml'


def setup_logging(default_path=LOGGING_CONFIG,
                  default_level=logging.INFO):
    """
    Setup logging configuration from file
    :param: default_path: Default logging configuration path
    :param: default_level: Default logging level

    """
    _level = default_level
    path = default_path
    if os.path.exists(path):
        with open(path, str('r')) as f:
            config = yaml.safe_load(f.read())
        logging.config.dictConfig(config)
        _level = config['root']['level']

    logging.basicConfig(level=_level)

if __name__ =="__main__":
    setup_logging() # Sets up logging