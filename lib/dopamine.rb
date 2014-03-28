require 'httparty'
 
class Dopamine
  include HTTParty
  
  #debug_output $stdout
  
  # use SSL
  base_uri 'http://api.usedopamine.com/v1'
  
  format :json
  
  HEADERS = {
    'Accept' => 'application/json',
    'Content-Type' => 'application/x-www-form-urlencoded'
  }
 
  def initialize(api_token, api_key, app_id, device_type=3)
    @api_token = api_token
    @api_key = api_key
    @app_id = app_id
    @device_type = device_type
    HEADERS.merge!('User-Agent'=> "#{@app_id}")
  end

  def get_user(unique_id, id_type=5)
    query = config.merge(
      'deviceType' => @device_type,
      'IDType' => id_type,
      'uniqueID' => unique_id
    )
    self.class.get('/user', query: query, headers: HEADERS)
  end

  def reinforce?(user_uri, hablet_id)
    query = config.merge(
      'deviceType' => @device_type,
      'userURI' => user_uri,
      'habletID' => hablet_id
    )
    self.class.get("/user/#{user_uri}/app/#{@app_id}", query: query, headers: HEADERS)
  end

  def redeem(user_uri, hablet_id, email)
    body = config.merge(
      'deviceType' => @device_type,
      'userURI' => user_uri,
      'habletID' => hablet_id, 
      'email' => email
    )
    self.class.post("/user/#{user_uri}/app/#{@app_id}/", body: body, headers: HEADERS)
  end

  private

  def config
    {'key' => @api_key, 'token' => @api_token, 'appID' => @app_id}
  end
end