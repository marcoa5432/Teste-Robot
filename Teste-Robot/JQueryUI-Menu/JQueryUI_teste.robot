*** Settings ***
Documentation    Essa suíte testa a pagina de teste the-internet.herokuapp.com/JqueryUI
Resource         ./JQueryUI_resouce.robot 
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador 
#==================================================================================================================================================
*** Test Cases ***
Caso de teste 01 - Entrar na pagina JqueryUI 
    Entrar na pagina JqueryUI clicar nos raidos botoes
    Conferir as tabs da pagina