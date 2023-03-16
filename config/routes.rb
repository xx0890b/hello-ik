Rails.application.routes.draw do
  
  post 'user/regist'
  get 'user/:name/message/from/:start_date_time/to/:end_date_time' => 'messages#search'
  get 'user/:name/message' => 'messages#show'
  post 'user/:name/message/regist' => 'messages#regist'
  root "hello#index"
end
