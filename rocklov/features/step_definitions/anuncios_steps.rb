Dado('que eu tenho o seguinte equipamento:') do |table|
     anuncio = table.rows_hash
     log anuncio
end

Quando('submeto o cadastro desse item') do
  find("input[placeholder$=equipamento]").set anuncio[:nome]
  find("#category").find('option', text: anuncio[:categoria]).select_option
  find("input[placeholderˆ=Valor]").set anuncio[:preco]

  click_button "Cadastrar"
end

Então('devo ver esse item no meu Dashboard') do
  pending # Write code here that turns the phrase above into concrete actions
end