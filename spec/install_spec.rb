require "spec_helper"

describe "dotfiles::install" do
  test_against_platforms do |platform, version|
    context "running #{platform}: #{version}" do

      let(:chef_run)     { ChefSpec::SoloRunner.new.converge("dotfiles::install") }
      let(:dotfiles_dir) { chef_run.node[:dotfiles][:directory] }
      let(:current_user) { chef_run.node[:current_user] }
      let(:home_dir)     { chef_run.node[:home] }

      it "links dotfiles_dir/bin to home_dir/bin" do
        expect(chef_run).to create_link("#{home_dir}/bin").
          with(to: "#{dotfiles_dir}/bin",
               owner: current_user)
      end

      it "links dotfiles_dir/zsh to home_dir/.zsh" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.zsh").
          with(to: "#{dotfiles_dir}/zsh",
               owner: current_user)
      end

      it "links dotfiles_dir/zshrc to home_dir/.zshrc" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.zshrc").
          with(to: "#{dotfiles_dir}/zshrc",
               owner: current_user)
      end

      it "links dotfiles_dir/vim to home_dir/.vim" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.vim").
          with(to: "#{dotfiles_dir}/vim",
               owner: current_user)
      end

      it "links dotfiles_dir/vimrc to home_dir/.vimrc" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.vimrc").
          with(to: "#{dotfiles_dir}/vimrc",
               owner: current_user)
      end

      it "links dotfiles_dir/gitconfig to home_dir/.gitconfig" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.gitconfig").
          with(to: "#{dotfiles_dir}/gitconfig",
               owner: current_user)
      end

      it "links dotfiles_dir/gitignore to home_dir/.gitignore" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.gitignore").
          with(to: "#{dotfiles_dir}/gitignore",
               owner: current_user)
      end

      it "links dotfiles_dir/githelpers to home_dir/.githelpers" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.githelpers").
          with(to: "#{dotfiles_dir}/githelpers",
               owner: current_user)
      end

      it "links dotfiles_dir/tmux.conf to home_dir/.tmux.conf" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.tmux.conf").
          with(to: "#{dotfiles_dir}/tmux.conf",
               owner: current_user)
      end

      it "links dotfiles_dir/gemrc to home_dir/.gemrc" do
        expect(chef_run).to create_dotfile_link("#{home_dir}/.gemrc").
          with(to: "#{dotfiles_dir}/gemrc",
               owner: current_user)
      end
    end
  end
end
