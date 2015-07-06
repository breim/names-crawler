Rails.application.routes.draw do
  get 'names', to: 'names#index', :defaults => { :format => 'json' }
end
