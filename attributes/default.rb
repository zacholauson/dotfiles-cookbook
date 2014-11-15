default[:current_user] = "vagrant"
default[:home]         = "/Users/#{default[:current_user]}"

default[:dotfiles] = {
  repo:      "https://github.com/zacholauson/dotfiles.git",
  directory: "/Users/vagrant/.dotfiles"
}


