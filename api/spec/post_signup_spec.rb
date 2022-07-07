require_relative 'routes/signup'
require_relative 'libs/mongo'

describe 'POST /signup' do
  context 'novo usuario' do 
    before(:all) do
      payload = { name: 'Atena', email: 'atena@live.com.br', password: 'pwd123' }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it 'valida status code' do
      expect(@result.code).to eql 200
    end

    it 'valida id do usuario' do 
      expect(@result.parsed_response['_id'].length).to eql 24
    end
  end

  context 'usuario ja existe' do
    before(:all) do
      #Dado possuir um novo usuario
      payload = { name: 'Melissa', email: 'melissa@live.com.br', password: 'pwd123' }
      MongoDB.new.remove_user(payload[:email])

      #E inserir o email desse usuário que já foi cadastrado no sistema
      Signup.new.create(payload)

      #Quando fazer uma requisição para a rota /signup
      @result = Signup.new.create(payload)
    end

    it 'deve retornar 409' do

      #Então validar que o retorno é 409
      expect(@result.code).to eql 409
    end

    it 'deve retornar mensagem' do
      expect(@result.parsed_response['error']).to eql 'Email already exists :('
    end
  end

  context 'validar campos obrigatorios' do
    before(:all) do
      payload_sem_name = { name: '', email: 'melissa@live.com.br', password: 'pwd123' }
      payload_sem_email = { name: 'Melissa', email: '', password: 'pwd123' }
      payload_sem_password = { name: 'Melissa', email: 'melissa@live.com.br', password: '' }

      @sem_name = Signup.new.create(payload_sem_name)
      @sem_email = Signup.new.create(payload_sem_email)
      @sem_password = Signup.new.create(payload_sem_password)

    end

    it 'tentativa de cadastro sem name deve retornar mensagem de aviso' do
      expect(@sem_name.code).to eql 412
      expect(@sem_name.parsed_response['error']).to eql 'required name'
    end

    it 'tentativa de cadastro sem email deve retornar mensagem de aviso' do
      expect(@sem_email.code).to eql 412
      expect(@sem_email.parsed_response['error']).to eql 'required email'
    end

    it 'tentativa de cadastro sem password deve retornar mensagem de aviso' do
      expect(@sem_password.code).to eql 412
      expect(@sem_password.parsed_response['error']).to eql 'required password'
    end
  end
end
