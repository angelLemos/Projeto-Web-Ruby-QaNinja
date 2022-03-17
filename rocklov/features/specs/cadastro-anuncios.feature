#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos 
    Para que eu possa disponibiliza-los para locação

    @cadastro_anuncio
    Cenario: Novo equipo

         Dado que eu tenho o seguinte equipamento:
               |thumb    | guitarra-fender-strato.jpeg|
               |nome     | Fender Strato              |
               |categoria| Cordas                     |
               |preco    | 200                        |
         Quando submeto o cadastro desse item
         Então devo ver esse item no meu Dashboard