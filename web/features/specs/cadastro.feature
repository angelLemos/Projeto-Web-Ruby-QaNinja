#language: pt

@cadastro
Funcionalidade: Cadastro
  Eu como um músico que possui equipamentos musicais
  Quero fazer o meu cadastro no RockLov
  Para que eu possa disponibilizá-los para locação

  @cadastro_usuario
  Cenario: Fazer cadastro
    Dado que acesso a página de cadastro
    Quando submeto o seguinte formulário de cadastro:
      | nome     | email                | senha       |
      | Angelica | angelica30@gmail.com | angelica123 |
    Então sou redirecionado para o Dashboard

  @tentativas_cadastro
  Esquema do Cenario: Tentativa de cadastro
    Dado que acesso a página de cadastro
    Quando submeto o seguinte formulário de cadastro:
      | nome         | email         | senha         |
      | <nome_input> | <email_input> | <senha_input> |
    Então vejo a mensagem de alerta: "<mensagem_output>"

      Exemplos:
      | nome_input     | email_input             | senha_input | mensagem_output                  |
      |                | angelica.lj@gmail.com   | alj123      | Oops. Informe seu nome completo! |
      | Angelica Lemos |                         | angelica123 | Oops. Informe um email válido!   |
      | Angelica Lemos | angelica.lj#gmail.com   | angelica123 | Oops. Informe um email válido!   |
      | Angelica Lemos | angelica.lj$gmail.com   | angelica123 | Oops. Informe um email válido!   |
      | Angelica Lemos | angelicajesus@gmail.com |             | Oops. Informe sua senha secreta! |

