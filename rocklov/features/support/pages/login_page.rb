class LoginPage
  include Capybara::DSL

  def acessar_site
    visit "/"
  end

  def txt_email 
    return find("input[placeholder='Seu email']")
  end

  def txt_senha
    return find('input[type=password]')
  end

  def btn_entrar
    click_button 'Entrar'
  end
end
