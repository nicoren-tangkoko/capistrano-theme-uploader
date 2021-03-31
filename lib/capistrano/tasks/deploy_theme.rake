namespace :capistrano-theme-uploader do
    desc 'upload theme compiled files'
    task :upload_theme do
      run_locally do
          role_properties(:app) do |server|
              ssh_options = server.ssh_options
              fetch(:themes_to_deploy).each do |theme|
              themesParentDir = theme.split("/")
              themesParentDir.pop()
              execute "scp -r  -P #{server.ssh_options[:port]} #{ENV['SOURCE_PATH']}/#{fetch(:repo_tree)}/#{theme} #{server.user}@#{server.hostname}:#{release_path}/#{themesParentDir.join("/")}"
              end
          end
      end
    end
  end