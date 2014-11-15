default[:current_user] = "vagrant"
default[:home]         = "/Users/#{default[:current_user]}"

default[:dotfiles] = {
  repo:      "https://github.com/zacholauson/dotfiles.git",
  directory: "/Users/vagrant/.dotfiles",

  names: [
    "zsh",
    "zshrc",

    "vim",
    "vimrc",

    "gitconfig",
    "gitignore",
    "githelpers",

    "tmux.conf",

    "gemrc"
  ]
}

