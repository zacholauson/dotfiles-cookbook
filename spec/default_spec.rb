require "spec_helper"

describe "dotfiles::default" do
  test_against_platforms do

    let(:chef_run)      { ChefSpec::SoloRunner.new.converge("dotfiles::default") }

    let(:dotfiles_dir)  { chef_run.node[:dotfiles][:directory] }
    let(:dotfiles_repo) { chef_run.node[:dotfiles][:repo] }

    it "downloads zacholauson/dotfiles to ~/.dotfiles" do
      expect(chef_run).to checkout_git(dotfiles_dir).with(repository: dotfiles_repo)
    end
  end
end
