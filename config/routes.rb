Rails.application.routes.draw do
  
  post 'user/regist'
  
  get 'user/:name/message' => 'messages#show'
  post 'user/:name/message/regist' => 'messages#regist'
  root "hello#index"
end
