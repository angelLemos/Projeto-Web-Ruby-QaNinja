Dado('Login com {string} e {string}') do |email, password|
  @email = email
  @login_page.acessar_site
  @login_page.preencher_dados_login(email, password)
end

Dado('que acesso o formulário de cadastro de anúncios') do
  @dash_page.navegar_para_formulario_equipo
end

Dado('que eu tenho o seguinte equipamento:') do |table|
  @anuncio = table.rows_hash

  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando('submeto o cadastro desse item') do
  @equipos_page.criar_anuncio(@anuncio)
end

Entao('devo ver esse item no meu Dashboard') do
  expect(@dash_page.retornar_lista).to have_content @anuncio[:nome]
  expect(@dash_page.retornar_lista).to have_content "R$#{@anuncio[:preco]}/dia"
end