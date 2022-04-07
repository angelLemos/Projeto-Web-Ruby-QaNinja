

class SignupPage 
  include Capybara::DSL

  def acessar_pagina_cadastro
    visit '/signup'
  end

  def criar_cadastro(user)
    find('#fullName').set user[:nome]
    find('#email').set user[:email]
    find('#password').set user[:senha]

    click_button 'Cadastrar'
  end
end