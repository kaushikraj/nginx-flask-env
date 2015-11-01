# Copyright 2013 Thatcher Peskens
# Copyright 2015 Kaushik Raj
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from python:2.7

maintainer Kaushik Raj <kaushik.raj@gmail.com>

run apt-get update
run apt-get install -y nginx supervisor
run easy_install pip

# install uwsgi now because it takes a little while
run pip install uwsgi

# install nginx
run apt-get install -y software-properties-common python-software-properties
run apt-get update
run add-apt-repository -y ppa:nginx/stable
run apt-get install -y sqlite3

# install our code
add . /home/docker/code/

# setup all the configfiles
run echo "daemon off;" >> /etc/nginx/nginx.conf
run rm /etc/nginx/sites-enabled/default
run ln -s /home/docker/code/nginx-app.conf /etc/nginx/sites-enabled/
run ln -s /home/docker/code/supervisor-app.conf /etc/supervisor/conf.d/

run pip install -r /home/docker/code/app/requirements.txt

expose 80
cmd ["supervisord", "-n"]