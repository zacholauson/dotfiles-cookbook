require "chefspec"

PLATFORMS = {
  "mac_os_x" => ["10.9.2", "10.10"],
  "ubuntu"   => ["10.04", "12.04", "14.04"]
}

def test_against_platforms(platforms = PLATFORMS, &block)
  platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform} #{version}" do
        before { Fauxhai.mock(platform: platform, version: version) }

module ChefSpec::API
  module LinkMatchers
    def create_dotfile_link(resource_name)
      ChefSpec::Matchers::ResourceMatcher.new(:link_dotfile, :create, resource_name)
    end
  end
end
