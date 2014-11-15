class ::Chef::Resource::LinkDotfile < ::Chef::Resource::Link

  provides :link_dotfile

  def initialize(name, run_context = nil)
    super
    @resource_name = :link_dotfile
    @target_file   = "#{node[:home]}/.#{name}"
    @to            = "#{node[:dotfiles][:directory]}/#{name}"
    @owner         = node[:current_user]
  end
end
