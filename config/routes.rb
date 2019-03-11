# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :links, except: %i[new edit update destroy index show create] do
        collection do
          post :shorten
        end
      end
    end
  end
end
