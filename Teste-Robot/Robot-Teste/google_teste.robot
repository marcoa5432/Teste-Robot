*** Settings ***
Documentation    Essa suíte testa a pagina de teste the-internet.herokuapp.com
Resource         ./google_resource.robot 
Resource         ./GLOBAL_KEYWORDS.robot
Resource         ./TEST_GLOBAL.robot
#==========================================================================================================================
Library         Browser
Library         Dialogs
Library         Screenshot
Library         Collections
Library         String
Library         OperatingSystem

#==========================================================================================================================
Suite Setup     Open Browser    ${BROWSER}
Suite Teardown  Close Browser
Test Timeout    30s
#==================================================================================================================================================
*** Test Cases ***
Caso de teste 01 - Verificar elemento visivel 
    Acessar a pagina de teste
    # Take Screenshot
#==================================================================================================================================================     
Caso de teste 02 - Add/Remove Elements
    Adicionar e remover elemento
#==================================================================================================================================================
Caso de teste 03 - Confirmar imagem na pagina 
    Confirmar imagens na pagina
#==================================================================================================================================================    
Caso de teste 04 - Checar o botão checkbox
    Confirmar checkbox disponivel
#===================================================================================================================================================    
Caso de teste 05 - Confirmar imagem quando estiver visivel  
    Confirmar imagem quando visivel 
#===================================================================================================================================================    
Caso de teste 06 - Checar e adicionar e preencher e confirmar 
    Adicionar o checkbox e adicionar na label  
#===================================================================================================================================================    
Caso de teste 07 - Esperar palavra oculta após login
    Testar Ambientes Com Links Diferentes
Caso de teste 08 - Esperar palavra oculta após login 2
    Testar Ambientes Com Links Diferentes 2 
Caso de teste 09 - Fechar mensagem da Modal
    Fechar modal na tela
Caso de teste 10 - testa autenticação
    Teste de formulario de autenticação
Caso de teste 11 - teste de perfil
    Teste de perfil           
Caso de teste 12 - teste para escrolar a pagina
    Escrolar pagina como teste de funcionalidade 
Caso de teste 13 - teste para input de numero
    Adicionar numero no input