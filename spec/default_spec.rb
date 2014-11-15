require "spec_helper"

describe "dotfiles::default" do
  test_against_platforms(PLATFORMS) do
    let(:chef_run) { ChefSpec::SoloRunner.new.converge("dotfiles::default") }

    it "downloads zacholauson/dotfiles to ~/.dotfiles" do
      expect(chef_run).to checkout_git("~/.dotfiles").with(repository: "https://github.com/zacholauson/dotfiles.git")
    end
  end
end
