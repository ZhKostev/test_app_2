class Api::BaseController < ActionController::Base
  self.without_modules *[AbstractController::Translation, AbstractController::AssetPaths,
                         ActionController::HideActions, ActionController::Renderers::All, ActionController::Flash,
                         ActionController::Streaming, ActionController::DataStreaming, ActionController::Redirecting,
                         ActionController::HttpAuthentication::Basic::ControllerMethods,
                         ActionController::HttpAuthentication::Digest::ControllerMethods,
                         ActionController::HttpAuthentication::Token::ControllerMethods]

  # TODO: Authentication should be places here(nothing about it in docs)

  def error_json(msg)
    # TODO: should be implemented. Nothing in doc
    { :result => false, :message => msg }
  end
end