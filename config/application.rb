require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DontYouLikeLehane
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  
  # Match .scss, .sass or .less comments. Example // TODO make some notes
  config.annotations.register_extensions("scss", "sass", "less", "haml") do |annotation|
    /\/\/\s*(#{annotation}):?\s*(.*)$/
  end

  config.action_view.embed_authenticity_token_in_remote_forms = true


  end
end
