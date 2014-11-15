link "#{node[:home]}/bin" do
  to "#{node[:dotfiles][:directory]}/bin"
  owner node[:current_user]
end

link_dotfile("zsh")
link_dotfile("zshrc")

link_dotfile("vim")
link_dotfile("vimrc")

link_dotfile("gitconfig")
link_dotfile("gitignore")
link_dotfile("githelpers")

link_dotfile("tmux.conf")

link_dotfile("gemrc")

