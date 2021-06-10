class GlobalSummary
    include HTTParty
  
  
    base_uri  'https://streinvestapi.herokuapp.com/investment/-fiHIulof76smI6OUmR0/'
  
    def initialize
      @options = {}
    end
  
    def index
      self.class.get('/', @options)
    end
end