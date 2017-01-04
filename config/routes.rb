Rails.application.routes.draw do
  root to: 'pushings#home'
  get 'send', to: 'pushings#send_sms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
