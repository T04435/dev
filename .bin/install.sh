git clone --bare https://github.com/T04435/setup.git $HOME/.setup
function setup {
   /usr/bin/git --git-dir=$HOME/.setup/ --work-tree=$HOME $@
}
mkdir -p .setup-backup
setup checkout
if [ $? = 0 ]; then
  echo "Checked out setup.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
setup checkout
setup config status.showUntrackedFiles no
