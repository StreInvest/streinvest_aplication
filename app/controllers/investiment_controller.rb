class InvestimentController < ApplicationController
    
    def initialize
        @summary_service = GlobalSummary.new
    end

    def home
        @hello = "Bem-vindo a pagina principal"
    end
    
    def index 
        @summarys = @summary_service.index
    end
end
