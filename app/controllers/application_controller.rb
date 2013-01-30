class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => "dayo", :password => "secret" unless Rails.env.development?

end
