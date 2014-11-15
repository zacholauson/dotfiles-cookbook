git "#{node[:dotfiles][:directory]}" do
  repository node[:dotfiles][:repo]
  action     :checkout
end
