load File.expand_path("../tasks/upload_theme.rake", __FILE__)

namespace :load do
  task :defaults do
    load "capistrano/capistrano-theme-uploader/defaults.rb"
  end
end
