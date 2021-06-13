class InvestimentController < ApplicationController
    
	def initialize
			@summary_service = GlobalSummary.new
			@message = ''
	end

	def index
			@summarys = @summary_service.index
	end

	def show
			@summary = @summary_service.show(params[:invest_id]) 
	end

	def new;end

	def create
		get_params(params['post'])
	end

	def edit
		@summary_edit = @summary_service.show(params[:invest_id])
	end

	def update
    puts params
  end

	private

	def get_params(params)

		result = json_parser(params)

		@summary_new = @summary_service.create(result)
	
		if @summary_new['status'] == 201
			@message = 'deu bom meu rapaz'
		else
			@message = 'deu rium meu rapaz'
		end
	end

	def json_parser(params)
		{
			"investment_name": params['nome'],
			"status": params['status'],
			"risk": params['risco'],
			"category": params['categoria'],
			"consortium": params['consorcio_id']  || "60b03825fcf1440015381f38",
			"profitability": {
				"day": params['dia'],
				"month": params['mes'],
				"year": params['ano'],
				"score": params['score'],
				"minimum_value": params['minimo']
			}
		}
	end
end
