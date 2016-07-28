Rails.application.routes.draw do

  root 'sales#index'

  #root 'statistics#index'
  get 'statistics/index'
  resources :homes
  resources :charts, only: [] do
    collection do
      get 'sporters_by_age'
      get 'sporters_by_country'
      get 'results_by_country'
      get 'competition_by_year'
      get 'chart_by_tenpo_code'
    end
  end
  get 'statistics/search' => 'statistics#search'
  get 'sales/search' => 'sales#search'
end
