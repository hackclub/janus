class ApplicationController < ActionController::Base
  allow_browser versions: :modern # supporting webp images, web push, badges, import maps, and CSS nesting/:has
end
