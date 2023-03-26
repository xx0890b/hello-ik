Rails.application.routes.draw do
  get 'user/:name/message/at/:date_time' => 'messages#at'
  post 'user/regist'
  get 'user/:name/message/from/:start_date_time/to/:end_date_time' => 'messages#search'
  get 'user/:name/message' => 'messages#list'
  post 'user/:name/message/regist' => 'messages#regist'
  root "hello#index"
  get 'user/:name/message' => 'messages#list'
  get 'user/:name/message/unread' => 'messages#unread_list'
end
