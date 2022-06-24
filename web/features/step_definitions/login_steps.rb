Dado('que acesso a página principal') do
  @login_page.acessar_site
end

Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
  @login_page.preencher_dados_login(email, password)
end
