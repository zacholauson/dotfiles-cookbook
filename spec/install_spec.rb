require "spec_helper"

describe "dotfiles::install" do
  test_against_platforms do |platform, version|
    context "running #{platform}: #{version}" do

      let(:chef_run)     { ChefSpec::SoloRunner.new.converge("dotfiles::install") }
      let(:dotfiles_dir) { chef_run.node[:dotfiles][:directory] }
      let(:home_dir)     { chef_run.node[:home] }

      it "links dotfiles_dir/zsh to home_dir/.zsh" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.zsh").
          with(to: "#{dotfiles_dir}/zsh")
      end

      it "links dotfiles_dir/zshrc to home_dir/.zshrc" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.zshrc").
          with(to: "#{dotfiles_dir}/zshrc")
      end

      it "links dotfiles_dir/vim to home_dir/.vim" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.vim").
          with(to: "#{dotfiles_dir}/vim")
      end

      it "links dotfiles_dir/vimrc to home_dir/.vimrc" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.vimrc").
          with(to: "#{dotfiles_dir}/vimrc")
      end

      it "links dotfiles_dir/gitconfig to home_dir/.gitconfig" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.gitconfig").
          with(to: "#{dotfiles_dir}/gitconfig")
      end

      it "links dotfiles_dir/gitignore to home_dir/.gitignore" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.gitignore").
          with(to: "#{dotfiles_dir}/gitignore")
      end
    end
  end
end
