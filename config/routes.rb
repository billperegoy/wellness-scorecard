WellnessScorecard::Application.routes.draw do
  get "fitbit/login"
  get "fitbit/get_api_data"
  root to: 'fitbit#login'
end
