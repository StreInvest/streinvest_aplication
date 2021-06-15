class ConsortiumController < ApplicationController
  
  def initialize
    @summary_service = GlobalConsortium.new
    @message = ''
  end

  
  def index
    @summarys = @summary_service.index
  end

  def new;end

  def create
    get_params_create(params['post'])
  end

  def edit
		@summary_show = @summary_service.show(params['conso_id'])
	end

  def update
		get_params_update(params['post']['conso_id'], params['post'])
  end

  def destroy
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
			@message = 'deu ruim meu rapaz'
		end
	end

	def json_parser(params)
		{
			"consortium_name": params['nome']
		}
	end
end
