class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  inertia_share flash: -> { flash.to_hash }
end
