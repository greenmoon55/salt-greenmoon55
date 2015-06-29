vim:
  pkg.installed

git:
  pkg.installed

nethogs:
  pkg.installed

salt://scripts/get-pip.py:
  cmd.script

flake8:
  pip.installed:
    - name: flake8

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
