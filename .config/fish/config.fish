if status --is-login
  set PATH ~/bin /usr/local/bin $PATH opt/local/bin /opt/local/sbin /usr/bin:/bin /usr/sbin:/sbin /usr/local/git/bin
  set SSL_CERT_FILE /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

  set -x EDITOR vim
  set -x LC_ALL 'en_US.UTF-8'
  set -x JAVA_HOME /usr
  set -x FZF_DEFAULT_COMMAND '(ag -l -g "" || git ls-tree -r --name-only HEAD || find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'
  set -x TERM="xterm-256color"

  eval sh $HOME/.config/base16-shell/base16-grayscale.dark.sh
end

function fish_prompt -d "Write out the prompt"
  printf '%s@%s%s%s%s [%s]> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) $vi_mode
end
