#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos 
    Para que eu possa disponibiliza-los para locação

    Contexto: Login
      * Login com "mel@gmail.com" e "pwd123"

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
    Esquema do Cenario: Tentativa de cadastro de anúncios

         Dado que acesso o formulário de cadastro de anúncios
         E que eu tenho o seguinte equipamento:
               | thumb     | <foto>      |
               | nome      | <nome>      |
               | categoria | <categoria> |
               | preco     | <preco>     |
         Quando submeto o cadastro desse item
         Então conter a mensagem de alerta: "<saida>"

         Exemplos: 
         | foto          | nome              | categoria | preco | saida                                |
         |               | Violao de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
         | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!      |
         | mic.jpg       | Microfone         |           | 100   | Informe a categoria                  |
         | trompete.jpg  | Trompete          | Outros    |       | Informe o valor da diária            |
         | trompete.jpg  | Trompete Clássico | Outros    |  abc  | O valor da diária deve ser numérico! |
         | mic.jpg       | Microfone Top     | Outros    | 100a  | O valor da diária deve ser numérico! |