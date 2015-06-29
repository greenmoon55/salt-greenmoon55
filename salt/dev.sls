vim:
  pkg.installed

git:
  pkg.installed

nethogs:
  pkg.installed

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

virtualenv:
  pip.installed

virtualenvwrapper:
  pip.installed

flake8:
  pip.installed

ipython:
  pkg.installed

/home/cloud/.vimrc:
  file.managed:
    - source: salt://files/.vimrc
    - user: cloud
    - group: cloud

/home/cloud/.vim:
  file.recurse:
    - source: salt://files/.vim
    - user: cloud
    - group: cloud

tmux-ppa:
  pkgrepo.managed:
    - ppa: pi-rho/dev
    - require_in:
      - pkg: tmux

tmux:
  pkg.installed

/home/cloud/.tmux.conf:
  file.managed:
    - source: salt://files/.tmux.conf
    - user: cloud
    - group: cloud
    - require:
      - pkg: tmux
