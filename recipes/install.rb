include_recipe "dotfiles::download"

link "#{node[:home]}/bin" do
  to "#{node[:dotfiles][:directory]}/bin"
  owner node[:current_user]
end

node[:dotfiles][:names].each do |dotfile_name|
  link_dotfile dotfile_name
end
