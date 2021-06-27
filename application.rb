require "action_controller/railtie"
require "action_cable/engine"
require "active_model"
require "active_record"
require "nulldb/rails"
require "rails/command"
require "rails/commands/server/server_command"
require "cable_ready"
require "stimulus_reflex"

module ApplicationCable; end

class ApplicationCable::Connection < ActionCable::Connection::Base
  identified_by :session_id

  def connect
    self.session_id = request.session.id
  end  
end

class ApplicationCable::Channel < ActionCable::Channel::Base; end

class ApplicationController < ActionController::Base; end

class ApplicationReflex < StimulusReflex::Reflex; end

class MiniApp < Rails::Application
  require "stimulus_reflex/../../app/channels/stimulus_reflex/channel"
  Dir[File.expand_path('../app/**/*.rb', __FILE__)].each {|path| require path}

  config.action_controller.perform_caching = true
  config.consider_all_requests_local = true
  config.public_file_server.enabled = true
  config.secret_key_base = "cde22ece34fdd96d8c72ab3e5c17ac86"
  config.secret_token = "bf56dfbbe596131bfca591d1d9ed2021"
  config.session_store :cache_store
  config.hosts.clear

  Rails.cache = ActiveSupport::Cache::RedisCacheStore.new(url: "redis://localhost:6379/1")
  Rails.logger = ActionCable.server.config.logger = Logger.new($stdout)
  ActionCable.server.config.cable = {"adapter" => "redis", "url" => "redis://localhost:6379/1"}
  ApplicationController.append_view_path("app/views")

  routes.draw do
    mount ActionCable.server => "/cable"
    get '___glitch_loading_status___', to: redirect('/')
    resource :demo, only: :show
    root "demos#show"
  end
end

ActiveRecord::Base.establish_connection adapter: :nulldb, schema: "schema.rb"

Rails::Server.new(app: MiniApp, Host: "0.0.0.0", Port: ARGV[0]).start
