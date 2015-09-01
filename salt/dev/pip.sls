install pip:
  cmd.script:
    - name: salt://scripts/get-pip.py

/home/cloud/.pip/pip.conf:
  file.managed:
    - source: salt://files/pip.conf
    - makedirs: True
    - user: cloud
    - group: cloud
    - require:
      - cmd: install pip

setuptools:
  pip.installed:
    - upgrade: True

flake8:
  pip.installed

git-review:
  pip.installed

ipython:
  pip.installed
