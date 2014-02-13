require 'httparty'
 
class Freeplay
  include HTTParty
  
  #debug_output $stdout
  
  # use SSL
  base_uri 'http://api.freeplay.co/v1'
  
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
      'IDType' => id_type,
      'uniqueID' => unique_id
    )
    self.class.get('/user', query: query, headers: HEADERS)
  end

  def reinforce?(user_uri, hablet_id)
    query = config.merge(
      'habletID' => hablet_id
    )
    self.class.get("/user/#{user_uri}/app/#{@app_id}", query: query, headers: HEADERS)
  end

  def redeem(user_uri, hablet_id, email)
    query = config.merge(
      'habletID' => hablet_id,
      'email' => email
    )
    self.class.post("/user/#{user_uri}/app/#{@app_id}", query: query, headers: HEADERS)
  end

  private

  def config
    {"token" => @api_token, "key" => @api_key, "appID" => @app_id, "deviceType" => @device_type}
  end
end