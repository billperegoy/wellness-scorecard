class TwitterController < ApplicationController
  def login
    base_url = 'https://api.twitter.com'

    consumer_key = 'ylpOoMDM4VuvJ57HU21qw'
    consumer_secret = 'xC1DoP5EgiTuohCc3LQy8qzVleAhAYmho9ZyGppOtM'

    token_hash = {
      :oauth_token => consumer_key,
      :oath_token_secret => consumer_secret
    }
    
    callback_url = 'http://loclhost:3000/twitter/get_api_data'

    consumer = OAuth::Consumer.new(
      consumer_key,
      consumer_secret,
      { :site => base_url, :scheme => :header }
    )

    access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    response = access_token.request(:get,
      'https://api.twitter.com/1.1/statuses/home_timeline.json')
    @result = response 

  end

  def get_api_data
  end
end
