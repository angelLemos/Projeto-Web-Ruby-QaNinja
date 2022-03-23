Dado('que estou logado como {string} e {string}') do |email, password|
  visit "/"
  find("input[placeholder='Seu e-email']").set email
  find('input[type=password]').set password

  click_button 'Entrar'
end

Dado('que acesso o formulário de cadastro de anúncios') do
  click_button 'Criar anúncio'
  # isso é um checkpoint para garantir que estou no lugar correto
  expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento:') do |table|
  @anuncio = table.rows_hash
  log @anuncio
end

Quando('submeto o cadastro desse item') do
  find('input[placeholder$=equipamento]').set @anuncio[:nome]
  find('#category').find('option', text: @anuncio[:categoria]).select_option
  find('#price').set @anuncio[:preco]

  #click_button 'Cadastrar'
  sleep(10) #temporario
end

Entao('devo ver esse item no meu Dashboard') do
  pending # Write code here that turns the phrase above into concrete actions
end