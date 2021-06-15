class GlobalConsortium
  require 'json'
  include HTTParty
  
  
  base_uri  'https://streinvestapi.herokuapp.com/'
    
  def initialize
    @token = '-fiHIulof76smI6OUmR0'
    @options = {}
  end

  def index
    self.class.get("/consortium/#{@token}/", @options)
  end
  def show(id)
    self.class.get("/consortium/#{@token}/#{id}", @options)
  end

  def create(params)
    self.class.post("/consortium/#{@token}", :body => params.to_json,  :headers => { 'Content-Type' => 'application/json' } )
  end

  def update(id, params)
    self.class.put("/consortium/#{@token}/#{id}", :body => params.to_json,  :headers => { 'Content-Type' => 'application/json' } )
  end

  def delete(id)
    self.class.delete("/consortium/#{@token}/#{id}")
  end
end