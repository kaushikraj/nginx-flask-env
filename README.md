## Modified from [https://github.com/kaushikraj/dockerfile.flask-uwsgi-nginx](https://github.com/kaushikraj/dockerfile.flask-uwsgi-nginx). 

# Flask, uWSGI and Nginx in a container with Enivornment Variable.

Argument parameters may not be supplied to a Flask app via docker command line when the
entrypoint is supervisord. This sample shows a workaround on how environment variables can
be used to achieve the same.

### Build and run
* docker build -t webapp .
* docker run -d -p 80:80 -e ReturnData="Hello Kaushik" webapp

### See the output
* curl -X GET http://localhost/