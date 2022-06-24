Então('sou redirecionado para o Dashboard') do
  expect(@dash_page.estar_na_dash?).to be true
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert|
  expect(@alert.alert_dark).to eql expect_alert
end

Então('conter a mensagem de alerta: {string}') do |expect_alert|
  expect(@alert.alert_dark).to have_text expect_alert
end
