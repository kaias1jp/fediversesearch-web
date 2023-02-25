Rails.application.routes.draw do
scope "(:locale)", locale: /en|ja|zh_Hant|de/ do
  get 'menu', to:'web#menu'
  get 'optout', to: 'web#optout'
  get 'about', to: 'web#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'web#home'
    get '/:locale' => 'web#home'
  end
end
