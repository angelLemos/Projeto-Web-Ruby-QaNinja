class LoginPage
  include Capybara::DSL

  def acessar_site
    visit "/"
  end

  def preencher_dados_login(email, password)
    find("input[placeholder='Seu email']").set email
    find('input[type=password]').set password
    click_button 'Entrar'
  end
end
