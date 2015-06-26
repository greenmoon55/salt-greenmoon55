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

#https://github.com/greenmoon55/dotfiles.git:
#  git.latest:
#    - target: /home/cloud/dotfiles

#/home/cloud/dotfiles:
#  file.directory:
#    - user: cloud
#    - group: cloud
#    - recurse:
#      - user
#      - group 
#    - require:
#      - git: https://github.com/greenmoon55/dotfiles.git

#cp /home/cloud/dotfiles/.vimrc /home/cloud:
#  cmd.run:
#    - require:
#      - file: /home/cloud/dotfiles
#    - user: cloud
#    - group: cloud
      
#/home/cloud/:
#  file.directory:
#    - user: cloud
#    - group: cloud
#    - recurse:
#      - user
#      - group 
#    - require:
#      - cmd: cp /home/cloud/dotfiles/.* /home/cloud

#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim:
#  cmd.run:
#    - user: cloud
#    - group: cloud

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
