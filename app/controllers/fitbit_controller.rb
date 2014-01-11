class FitbitController < ApplicationController
  def login
    base_url = 'http://api.fitbit.com'
    req_url = base_url + '/oath/request_token'
    auth_url = base_url + '/oath/authorize'
    acc_url = base_url + '/oath/access_token'

    consumer_key = '45eb861ac9084fd6b15305cd298d8189'
    consumer_secret = 'caa8958e83ac48ccac3b0de98458f55b'

    callback_url = 'http://localhost:3000/fitbit/view'
    
    consumer = OAuth::Consumer.new( 
      consumer_key,
      consumer_secret,
      { :site => base_url }
    )

    request_token = consumer.get_request_token(:oauth_callback => callback_url)
    session[:request_token]=request_token
    redirect_to request_token.authorize_url
  end

  def view
    request_token = session[:request_token]
    access_token = request_token.get_access_token(:oauth_verifier => params['oauth_verifier'])

    ret_val = access_token.get('/1/user/-/profile.json')
    if ret_val.is_a?(Net::HTTPSuccess)
      @user = JSON.parse(ret_val.body)['user']
    end

    ret_val = access_token.get('/1/user/-/body/log/weight/date/2014-01-11.json')
    if ret_val.is_a?(Net::HTTPSuccess)
      @weight = JSON.parse(ret_val.body)['weight']
    end

  end
end
