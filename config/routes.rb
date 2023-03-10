Rails.application.routes.draw do
  
  post 'user/regist'
  post 'messages/regist'

  root "hello#index"
end
