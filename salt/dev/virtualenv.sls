virtualenv:
  pip.installed

virtualenvwrapper:
  pip.installed

/home/cloud/Envs:
  file.exists

/home/cloud/.bashrc:
  file.append:
    - text:
      - export WORKON_HOME=~/Envs
      - source /usr/local/bin/virtualenvwrapper.sh
