git "#{node[:dotfiles][:directory]}" do
  repository node[:dotfiles][:repo]
end

execute "chown -R #{node[:current_user]} #{node[:dotfiles][:directory]}"
