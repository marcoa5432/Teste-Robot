*** Settings ***
Library     Browser
Library     Dialogs
Library     Screenshot
Resource    ./GLOBAL_KEYWORDS.robot
Resource    ./TEST_GLOBAL.robot
Resource    ./JQueryUI_resouce.robot 
 
 #==========================================================================================================================
*** Keywords ***
Abrir o navegador
    Open Browser                 ${BROWSER}              chromium                        
    Set Viewport Size            1364                       964                   
Fechar o navegador 
    Take Screenshot
    Close Browser
#===========================================================================================================================
Acessar a pagina de teste
    Click                        //a[@href="/abtest"]  
    # Take Screenshot 
    Wait For Elements State      //div[@class="example"]//h3 
#===========================================================================================================================     
Adicionar e remover elemento         
    Click Element                       (//li)[2]//a  
    Click                        //button[@onclick="addElement()"]
    Take Screenshot
    Click                        //button[@class="added-manually"]
#===========================================================================================================================    
Confirmar imagens na pagina 
    Click                        (//li)[4]//a 
    Wait For Elements State      //img[@src="asdf.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="hjkl.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="img/avatar-blank.jpg"]
    Take Screenshot
#==========================================================================================================================    
Confirmar checkbox disponivel
    Click                        (//li)[6]//a 
    Check Checkbox               (//input[@type="checkbox"])[1] 
    Sleep                        5s    
    Click With Options           (//input[@type="checkbox"])[2]
    Take Screenshot
    Sleep                        5s
#==========================================================================================================================    
Confirmar imagem quando visivel 
    Click                        (//li)[12]//a 
      ${tentativa}=    Set Variable    1
    WHILE    ${tentativa} <= ${MAX_TENTATIVAS}
        Log    Tentativa ${tentativa}
        ${encontrou}=    Run Keyword And Return Status       ${IMAGEM_DESEJADA}
        Run Keyword If    ${encontrou}    Exit For Loop
        Click    ${BOTAO_ATUALIZAR}
        Sleep    1s
        ${tentativa}=    Evaluate    ${tentativa} + 1
    END
    Log    Imagem encontrada! Teste finalizado com sucesso
#==========================================================================================================================    
Adicionar o checkbox e adicionar na label 
    Click Element                         (//li)[13]//a 
    Click Element                        //input[@label="blah"]
    Click Element                        //input[@label="blah"]/../..//button
    Wait For Element Visible       //p[text()="It's gone!"]        visible        timeout= 5s
    Take Screenshot
    Click Element                         //input[@type="text"]/..//button
    Wait For Element Visible       //p[text()="It's enabled!"]     visible        timeout= 5s
    Fill Field                    //input[@type="text"]           ROBOTIZANDO WORLD
    Sleep                         5s
    Take Screenshot
#==========================================================================================================================
Testar Ambientes Com Links Diferentes 
    Click                         (//li)[14]//a  
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    # Wait For Load State           timeout= 5s

Testar Ambientes Com Links Diferentes 2    
    Click                         (//li)[14]//a   
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    # Wait For Load State           timeout= 5s
Fechar modal na tela 
    Click                         (//li)[15]//a
    Sleep                         2s
    Click                         //p[text()="Close"] 
Teste de formulario de autenticação
    Click                         (//li)[21]//a
    Fill Text                     //input[@name="username"]          João do pe de feijão
    Fill Text                     //input[@name="password"]          12345678
    Click                         //button[@class="radius"]  
    Wait For Elements State        //div[@id="flash"]                visible                timeout=10s
    Sleep                         3s
Teste de perfil 
    Click                         (//li)[25]//a
    Click                         (//img[@src="/img/avatar-blank.jpg"])[1]
    Click                         (//div[@class="figcaption"]//h5)[1]
Escrolar pagina como teste de funcionalidade    
    Click                         (//li)[26]//a
    Scroll To                              
    Sleep                         3s
    Take Screenshot
Adicionar numero no input  
    Click                         (//li)[27]//a  
    Fill Text                     //input[@type="number"]            10
