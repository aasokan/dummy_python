FROM python:2

RUN  mkdir -p /code

# Install the virtualenv
ADD     requirements.txt /code/requirements.txt
ADD     requirements-dev.txt /code/requirements-dev.txt
RUN     virtualenv --python python2.7 /code/virtualenv_run
RUN     /code/virtualenv_run/bin/pip install \
            -r /code/requirements-dev.txt

# Make /code/logs writable for testing
RUN    mkdir /code/logs && chmod 0777 /code/logs

# Add code
ADD    . /code

WORKDIR /code
ENV     PATH=/code/virtualenv_run/bin:$PATH
ENV     PYTHONPATH /code

# Run the Script
# ENTRYPOINT ["python", "/src/http_log_monitor/cli.py"]
CMD echo
