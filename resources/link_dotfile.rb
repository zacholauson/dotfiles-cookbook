require 'chef/resource/link'

class ::Chef::Resource::LinkDotfile < ::Chef::Resource::Link

  provides :link_dotfile

  def initialize(name, run_context=nil)
    super
    @resource_name = :link_dotfile
    @provider      = Chef::Provider::Link
    @target_file   = "#{node[:home]}/.#{name}"
    @to            = "#{node[:dotfiles][:directory]}/#{name}"
    @action        = :create
    @link_type     = :symbolic
    @allowed_actions.push(:create, :delete)
  end
end
