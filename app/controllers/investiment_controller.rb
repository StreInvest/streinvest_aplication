class InvestimentController < ApplicationController
    
	def initialize
			@summary_service = GlobalInvestment.new
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
		get_params_create(params['post'])
	end

	def edit
		@summary_edit = @summary_service.show(params[:invest_id])
	end

	def update
    get_params_update(params['post']['invest_id'], params['post'])
  end

	def destroy
		@summary_delete = @summary_service.delete(params['invest_id'])

		if @summary_delete['status'] == 404
			@message = 'usuario já foi excluido'
		else
			@message = 'sucesso ao excluir'
		end
	end

	private

	def get_params_create(params)

		result = json_parser(params)

		@summary_new = @summary_service.create(result)
	
		if @summary_new['status'] == 201
			@message = 'deu bom meu rapaz'
		else
			@message = 'deu rium meu rapaz'
		end
	end


	def get_params_update(id, params)
		result = json_parser(params)
		@summary_update = @summary_service.update(id, result)
		if @summary_update['status'] == 200 
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
