require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:integration) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

namespace :nginx do
  desc "Starts nginx"
  task :start do
    `./build/nginx/sbin/nginx`
  end

  desc "Stops nginx"
  task :stop do  
    `./build/nginx/sbin/nginx -s stop`
  end

  desc "Recompiles nginx module"
  task :compile do 
    `./scripts/nginx-compile-module.sh modules`
  end
end

namespace :env do
  desc "Bootstraps the local development environment"
  task :bootstrap do 
    unless Dir.exists?("build") and Dir.exists?("vendor") 
      `./scripts/nginx-bootstrap.sh`
    end
  end

  desc "Clean local development environment"
  task :clean do
    `./scripts/nginx-bootstrap.sh clean`
  end
end

desc "Run integration tests"
task :default => [:bootstrap, "nginx:start", :integration, "nginx:stop"]
