Rails.application.routes.draw do
  get 'commands/valid_slack_token'
  get 'commands/command_params'
  get 'home/index'
  post 'commands/dialog', to: 'commands#dialog'
  get  'commands/dialog', to: 'commands#dialog'
  post 'commands/create', to: 'commands#create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # {} get 'chambas/index', to: 'chambas#index'
  # Defines the root path route ("/")
  root 'home#index'
 
end
