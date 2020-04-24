require 'rom-sql'
require 'rom/sql/rake_task'
require_relative 'config/application'

namespace :db do
  task :setup do
    Bix::Application.start(:db)
    ROM::SQL::RakeSupport.env = ROM.container(Bix::Application['db.config']) do
      config.gateways[:default].use_logger(Logger.new($stdout))
    end
  end
end
