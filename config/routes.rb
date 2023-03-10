Rails.application.routes.draw do
  
  post 'user/regist'
  post 'user/:name/message/regist' => 'messages#regist'
  root "hello#index"
end
