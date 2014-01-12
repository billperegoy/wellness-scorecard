WellnessScorecard::Application.routes.draw do
  get "twitter/login"
  get "twitter/get_api_data"
  get "fitbit/login"
  get "fitbit/get_api_data"
  root to: 'fitbit#login'
end
