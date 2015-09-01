virtualenv:
  pip.installed:
    - require:
      - sls: dev.pip

virtualenvwrapper:
  pip.installed:
    - require:
      - sls: dev.pip

/home/cloud/Envs:
  file.directory:
    - user: cloud
    - group: cloud

/home/cloud/.bashrc:
  file.append:
    - text:
      - export WORKON_HOME=~/Envs
      - source /usr/local/bin/virtualenvwrapper.sh
    - require:
      - pip: virtualenvwrapper
