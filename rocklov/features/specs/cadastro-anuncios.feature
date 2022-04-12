#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos 
    Para que eu possa disponibiliza-los para locação

    Contexto: Login
      * Login com "angelica@gmail.com" e "123456"

    @cadastro_anuncio
    Cenario: Novo equipo

         Dado que acesso o formulário de cadastro de anúncios
         E que eu tenho o seguinte equipamento:
               |thumb    | guitarra-fender-strato.jpeg|
               |nome     | Fender Strato              |
               |categoria| Cordas                     |
               |preco    | 200                        |
         Quando submeto o cadastro desse item
         Então devo ver esse item no meu Dashboard

    @temp
    Cenario: Cadastro anúncio sem foto

         Dado que acesso o formulário de cadastro de anúncios
         E que eu tenho o seguinte equipamento:
               |thumb    |              |
               |nome     | Fender Strato|
               |categoria| Cordas       |
               |preco    | 200          |
         Quando submeto o cadastro desse item
         Então conter a mensagem de alerta: "Adicione uma foto no seu anúncio!"