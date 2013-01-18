module Dayo
  class API < Grape::API

    prefix "api"

    #version 'v1'
    format :json
    #set :credentials, ['api', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'].freeze

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end


    # api methods to call
    resource :campaigns do
      get do
        Campaign.all.as_json(:only => [:id, :name, :description])
      end

      get ':id' do
        Campaign.find(params['id']).as_json(:only => [:id, :name, :description])
      end
    end

  end
end