Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post ':dest/*params(/path/*path)/:act', to: 'passthrough#main', as: :passthrough
end
