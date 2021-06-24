class ConsortiumController < ApplicationController
  before_action :authenticate_user!

  def initialize
    @summary_service = GlobalConsortium.new
    @message = ''
  end

  def index
    @summarys = @summary_service.index
  end

  def new; end

  def create
    get_params_create(params['post'])
  end

  def edit
    @summary_show = @summary_service.show(params['conso_id'])
  end

  def update
    get_params_update(params['post']['conso_id'], params['post'])
  end

  def destroy; end

  private

  def get_params_create(params)
    result = json_parser(params)

    @summary_new = @summary_service.create(result)

    @message = if @summary_new['status'] == 201
                 'deu bom meu rapaz'
               else
                 'deu rium meu rapaz'
               end
  end

  def get_params_update(id, params)
    result = json_parser(params)
    @summary_update = @summary_service.update(id, result)
    @message = if @summary_update['status'] == 200
                 'deu bom meu rapaz'
               else
                 'deu ruim meu rapaz'
               end
  end

  def json_parser(params)
    {
      "consortium_name": params['nome']
    }
  end
end
