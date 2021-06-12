class GlobalSummary
  require 'json'
  include HTTParty
  
  
  base_uri  'https://streinvestapi.herokuapp.com/'
    
  def initialize
    @token = '-fiHIulof76smI6OUmR0'
    @options = {}
  end

  def index
    self.class.get("/investment/#{@token}/", @options)
  end

  def show(id) 
    self.class.get("/investment/specific/#{@token}/#{id}", @options)
  end

  def create(params)
    self.class.post("/investment/#{@token}", :body => params.to_json,  :headers => { 'Content-Type' => 'application/json' } )
  end
end