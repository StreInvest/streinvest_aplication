class GlobalUser
  require 'json'
  include HTTParty

  base_uri 'https://streinvestapi.herokuapp.com/'

  def index
    self.class.get('/user/lists')
  end

  def show_id(id)
    self.class.get("/user/#{id}")
  end

  def show_email(email)
    self.class.get('/user/', { email: email })
  end

  def gera_new_token(id)
    self.class.get("/user/recover/#{id}")
  end

  def create(params)
    self.class.post('/user', body: params.to_json,
                             headers: { 'Content-Type' => 'application/json' })
  end

  def update(id, params)
    self.class.put("/user/#{id}", body: params.to_json,
                                  headers: { 'Content-Type' => 'application/json' })
  end

  def delete(id)
    self.class.delete("/user/#{id}")
  end
end
