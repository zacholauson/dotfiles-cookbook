require "spec_helper"

describe "dotfiles::default" do
  test_against_platforms do |platform, version|
    context "running #{platform}: #{version}" do

      let(:chef_run)      { ChefSpec::SoloRunner.new.converge("dotfiles::default") }

      let(:dotfiles_dir)  { chef_run.node[:dotfiles][:directory] }
      let(:dotfiles_repo) { chef_run.node[:dotfiles][:repo] }
      let(:current_user)  { chef_run.node[:current_user] }

      it "downloads zacholauson/dotfiles to the dotfiles_dir" do
        expect(chef_run).to sync_git(dotfiles_dir).with(repository: dotfiles_repo)
      end

      it "gives ownership of dotfiles_dir to the current_user" do
        expect(chef_run).to run_execute("chown -R #{current_user} #{dotfiles_dir}")
      end
    end
  end
end
