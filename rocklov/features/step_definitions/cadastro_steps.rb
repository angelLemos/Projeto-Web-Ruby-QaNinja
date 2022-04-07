Dado('que acesso a página de cadastro') do
  @signup_page.acessar_pagina_cadastro
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  user = table.hashes.first
  MongoDB.new.remove_user(user[:email])
  @signup_page.criar_cadastro(user)
end
