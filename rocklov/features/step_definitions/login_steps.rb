Dado('que acesso a página principal') do
  @login_page = LoginPage.new
  @login_page.acessar_site
end

Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
  @login_page.txt_email.set email
  @login_page.txt_senha.set password
  @login_page.btn_entrar
end
