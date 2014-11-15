def link_dotfile(name)
  link "#{node[:home]}/.#{name}" do
    to "#{node[:dotfiles][:directory]}/#{name}"
  end
end

