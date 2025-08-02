*** Settings ***
Library     Browser
Library     Dialogs
Library     Screenshot
Resource    ./GLOBAL_KEYWORDS.robot
Resource    ./google_resource.robot 
Resource     ./Var_Global.robot
#==========================================================================================================================
*** Keywords ***
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
    Click Web Element By Text                       (//li)[12]//a 
    ${tentativa}=    Set Variable    1
    WHILE    ${tentativa} <= ${MAX_TENTATIVAS}
        Log    Tentativa ${tentativa}
        ${encontrou}=    Run Keyword And Return Status       ${IMAGEM_DESEJADA}
        Run Keyword If    ${encontrou}    Exit For Loop
        Click Web Element By Text    ${BOTAO_ATUALIZAR}
        Sleep    1s
        ${tentativa}=    Evaluate    ${tentativa} + 1
    END
    Log    Imagem encontrada! Teste finalizado com sucesso
#==========================================================================================================================
# Adicionar o checkbox e adicionar na label
    Click                        (//li)[7]//a 
    Wait For Elements State      //input[@type="checkbox"]
    Take Screenshot
    Fill Text                    //input[@type="checkbox"]    Teste de checkbox
    Take Screenshot
    Click                        //button[@onclick="addCheckbox()"]
    Wait For Elements State      //label[contains(text(), "Teste de checkbox")]
    Take Screenshot
    Click                        //button[@onclick="removeCheckbox()"]
    Wait For Elements State      //label[contains(text(), "Teste de checkbox")]    not visible    timeout= 5s
    Take Screenshot
    Click                        //button[@onclick="enableCheckbox()"]
    Wait For Elements State      //input[@type="checkbox"]    enabled    timeout=
    5s
    Fill Text                    //input[@type="checkbox"]    ROBOTIZANDO WORLD
    Sleep                        5s
    Take Screenshot
#==========================================================================================================================
Testar Ambientes Com Links Diferentes 
    Click                        (//li)[14]//a  
    Click                        //a[@href="/dynamic_loading/1"]
    Click                        //div[@id="start"]//button
    # Wait For Load State           timeout= 5s
Testar Ambientes Com Links Diferentes 2    
    Click                        (//li)[14]//a
    Click                        //a[@href="/dynamic_loading/2"]
    Click                        //div[@id="start"]//button
    # Wait For Load State           timeout= 5s
#==========================================================================================================================
Fechar modal na tela
    Click                        (//li)[15]//a
    Wait For Elements State      //div[@class="modal"]    visible    timeout= 5s
    Take Screenshot
    Click                        //button[@class="close"]
    Wait For Elements State      //div[@class="modal"]    not visible    timeout= 5s
    Take Screenshot
#==========================================================================================================================
Teste de formulario de autenticação
    Click                        (//li)[16]//a
    Fill Text                    //input[@id="username"]    admin
    Fill Text                    //input[@id="password"]    admin
    Click                        //button[@type="submit"]
    Wait For Elements State      //div[@id="flash"]    visible    timeout= 5s
    Take Screenshot
#==========================================================================================================================
Teste de perfil
    Click                        (//li)[17]//a
    Wait For Elements State      //h4[text()="Welcome to the Secure Area. When you are done click logout below."]
    Take Screenshot
    Click                        //a[@href="/logout"]
    Wait For Elements State      //h2[text()="Login Page"]    visible    timeout= 5s
    Take Screenshot
#==========================================================================================================================
Escrolar pagina como teste de funcionalidade
    Click                        (//li)[18]//a
    Scroll To
    Sleep                        3s
    Take Screenshot    
Adicionar numero no input
    Click                        (//li)[19]//a    
    Wait For Elements State      //input[@type="number"]
    Take Screenshot
    Fill Text                    //input[@type="number"]    10
    Take Screenshot
    Click                        //button[@type="submit"]
    Wait For Elements State      //p[text()="You entered: 10"]    visible    timeout= 5s
    Take Screenshot
#==========================================================================================================================
# Acessar a pagina de teste
#     Click                        //a[@href="/abtest"]  
#     Take Screenshot 
#     Wait For Elements State      //div[@class="example"]//h3
#     Should Contain               //div[@class="example"]//h3    A/B Test Control Page
#     Take Screenshot
#==========================================================================================================================
Adicionar e remover elemento         
    Click Element                       (//li)[2]//a  
    Click                        //button[@onclick="addElement()"]
    Take Screenshot
    Click                        //button[@class="added-manually"]
    Wait For Elements State      //button[@class="added-manually"]    not visible    timeout= 5s
    Take Screenshot
#==========================================================================================================================
Confirmar imagens na pagina 
    Click                        (//li)[4]//a 
    Wait For Elements State      //img[@src="asdf.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="hjkl.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="img/avatar-blank.jpg"]
    Take Screenshot            
    Should Contain               //img[@src="asdf.jpg"]    asdf.jpg
    Should Contain               //img[@src="hjkl.jpg"]    hjkl.jpg
    Should Contain               //img[@src="img/avatar-blank.jpg"]    avatar-blank.jpg
#==========================================================================================================================
Confirmar checkbox disponivel
    Click                        (//li)[6]//a 
    Check Checkbox               (//input[@type="checkbox"])[1] 
    Sleep                        5s    
    Click With Options           (//input[@type="checkbox"])[2]
    Take Screenshot
    Should Be Checked            (//input[@type="checkbox"])[1]
    Should Be Checked            (//input[@type="checkbox"])[2]
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
    Should Contain               //img[@src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-6.jpg"]    Original-Facebook-Geek-Profile-Avatar-6.jpg
#==========================================================================================================================
# Adicionar o checkbox e adicionar na label 
    Click                         (//li)[13]//a 
    Click                         //input[@label="blah"]
    Click                         //input[@label="blah"]/../..//button
    Wait For Elements State       //p[text()="It's gone!"]        visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]
    Fill Text                     //input[@type="text"]    Teste de checkbox
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="It's gone!"]        not visible        timeout= 5s
    Take Screenshot    
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]
    Fill Text                     //input[@type="text"]    Teste de checkbox 2
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="It's gone!"]        not visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    Take Screenshot    
#==========================================================================================================================
Testar Ambientes Com Links Diferentes
    Click                         (//li)[14]//a  
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
Testar Ambientes Com Links Diferentes 2    
    Click                         (//li)[14]//a
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
Fechar modal na tela
    Click                         (//li)[15]//a
    Wait For Elements State      //div[@class="modal"]    visible    timeout= 5s
    Take Screenshot
    Click                         //button[@class="close"]
    Wait For Elements State      //div[@class="modal"]    not visible    timeout= 5s
    Take Screenshot
Teste de formulario de autenticação
    Click                         (//li)[21]//a        
    Fill Text                     //input[@id="username"]    admin
    Fill Text                     //input[@id="password"]    admin
    Click                         //button[@type="submit"]
    Wait For Elements State       //div[@id="flash"]    visible    timeout= 5s
    Take Screenshot
    Should Contain               //div[@id="flash"]    You logged into a secure area!
Teste de perfil
    Click                         (//li)[22]//a
    Wait For Elements State       //h4[text()="Welcome to the Secure Area. When you are done click logout below."]
    Take Screenshot
    Click                         //a[@href="/logout"]
    Wait For Elements State       //h2[text()="Login Page"]    visible    timeout= 5s
    Take Screenshot    
    Should Contain               //h2[text()="Login Page"]    Login Page
Escrolar pagina como teste de funcionalidade
    Click                         (//li)[23]//a
    Scroll To
    Sleep                         3s
    Take Screenshot
Adicionar numero no input
    Click                         (//li)[24]//a    
    Wait For Elements State       //input[@type="number"]
    Take Screenshot
    Fill Text                     //input[@type="number"]    10
    Take Screenshot    
    Click                         //button[@type="submit"]
    Wait For Elements State       //p[text()="You entered: 10"]    visible    timeout= 5s
    Take Screenshot
    Should Contain               //p[text()="You entered: 10"]    You entered: 10
#==========================================================================================================================    
# Acessar a pagina de teste
#     Click                        //a[@href="/abtest"]  
#     Take Screenshot 
#     Wait For Elements State      //div[@class="example"]//h3
#     Should Contain               //div[@class="example"]//h3    A/B Test Control Page
#     Take Screenshot
#==========================================================================================================================
Adicionar e remover elemento         
    Click Element                       (//li)[2]//a  
    Click                        //button[@onclick="addElement()"]
    Take Screenshot
    Click                        //button[@class="added-manually"]
    Wait For Elements State      //button[@class="added-manually"]    not visible    timeout= 5s
    Take Screenshot
#==========================================================================================================================
Confirmar imagens na pagina 
    Click                        (//li)[4]//a 
    Wait For Elements State      //img[@src="asdf.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="hjkl.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="img/avatar-blank.jpg"]
    Take Screenshot            
    Should Contain               //img[@src="asdf.jpg"]    asdf.jpg
    Should Contain               //img[@src="hjkl.jpg"]    hjkl.jpg
    Should Contain               //img[@src="img/avatar-blank.jpg"]    avatar-blank.jpg    
#==========================================================================================================================
Confirmar checkbox disponivel
    Click                        (//li)[6]//a 
    Check Checkbox               (//input[@type="checkbox"])[1] 
    Sleep                        5s    
    Click With Options           (//input[@type="checkbox"])[2]
    Take Screenshot
    Should Be Checked            (//input[@type="checkbox"])[1]
    Should Be Checked            (//input[@type="checkbox"])[2]
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
    Should Contain               //img[@src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-6.jpg"]    Original-Facebook-Geek-Profile-Avatar-6.jpg    
#==========================================================================================================================
# Adicionar o checkbox e adicionar na label
    Click                         (//li)[13]//a 
    Click                         //input[@label="blah"]
    Click                         //input[@label="blah"]/../..//button
    Wait For Elements State       //p[text()="It's gone!"]        visible        timeout= 5s
    # Take Screenshot
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    # Take Screenshot
    Click                         //input[@type="text"]
    Fill Text                     //input[@type="text"]    Teste de checkbox
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="It's gone!"]        not visible        timeout= 5s
    # Take Screenshot    
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    # Take Screenshot
    Click                         //input[@type="text"]
    Fill Text                     //input[@type="text"]    Teste de checkbox 2
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="It's gone!"]        not visible        timeout= 5s
    # Take Screenshot
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    # Take Screenshot
#==========================================================================================================================
Testar Ambientes Com Links Diferentes
    Click                         (//li)[14]//a  
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot        
Testar Ambientes Com Links Diferentes 2    
    Click                         (//li)[14]//a    
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button    
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
Fechar modal na tela
    Click                         (//li)[15]//a    
    Wait For Elements State      //div[@class="modal"]    visible    timeout= 5s
    Take Screenshot    
    Click                         //button[@class="close"]
    Wait For Elements State      //div[@class="modal"]    not visible    timeout= 5s
    Take Screenshot    
Teste de formulario de autenticação
    Click                         (//li)[21]//a    
    Fill Text                     //input[@id="username"]    admin
    Fill Text                     //input[@id="password"]    admin
    Click                         //button[@type="submit"]
    Wait For Elements State       //div[@id="flash"]    visible    timeout= 5s
    Take Screenshot    
    Should Contain               //div[@id="flash"]    You logged into a secure area!
Teste de perfil
    Click                         (//li)[22]//a
    Wait For Elements State       //h4[text()="Welcome to the Secure Area. When you are done click logout below."]
    Take Screenshot
    Click                         //a[@href="/logout"]
    Wait For Elements State       //h2[text()="Login Page"]    visible    timeout= 5s
    Take Screenshot    
    Should Contain               //h2[text()="Login Page"]    Login Page    
Escrolar pagina como teste de funcionalidade
    Click                         (//li)[23]//a        
    Scroll To
    Sleep                         3s
    Take Screenshot
Adicionar numero no input    
    Click                         (//li)[24]//a    
    Wait For Elements State       //input[@type="number"]
    Take Screenshot
    Fill Text                     //input[@type="number"]    10
    Take Screenshot    
    Click                         //button[@type="submit"]
    Wait For Elements State       //p[text()="You entered: 10"]    visible    timeout= 5s
    Take Screenshot
    Should Contain               //p[text()="You entered: 10"]    You entered: 10    
#==========================================================================================================================    
# Acessar a pagina de teste
#     Click                        //a[@href="/abtest"]  
#     Take Screenshot 
#     Wait For Elements State      //div[@class="example"]//h3
#     Should Contain               //div[@class="example"]//h3    A/B Test Control Page
#     Take Screenshot
#==========================================================================================================================
Adicionar e remover elemento
    Click Element                       (//li)[2]//a  
    Click                        //button[@onclick="addElement()"]
    Take Screenshot
    Click                        //button[@class="added-manually"]
    Wait For Elements State      //button[@class="added-manually"]    not visible    timeout= 5s
    Take Screenshot
#==========================================================================================================================
Confirmar imagens na pagina    
    Click                        (//li)[4]//a 
    Wait For Elements State      //img[@src="asdf.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="hjkl.jpg"]
    Take Screenshot
    Wait For Elements State      //img[@src="img/avatar-blank.jpg"]
    Take Screenshot            
    Should Contain               //img[@src="asdf.jpg"]    asdf.jpg
    Should Contain               //img[@src="hjkl.jpg"]    hjkl.jpg
    Should Contain               //img[@src="img/avatar-blank.jpg"]    avatar-blank.jpg
#==========================================================================================================================
Confirmar checkbox disponivel
    Click                        (//li)[6]//a 
    Check Checkbox               (//input[@type="checkbox"])[1] 
    Sleep                        5s    
    Click With Options           (//input[@type="checkbox"])[2]
    Take Screenshot
    Should Be Checked            (//input[@type="checkbox"])[1]
    Should Be Checked            (//input[@type="checkbox"])[2]
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
    Should Contain               //img[@src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-6.jpg"]    Original-Facebook-Geek-Profile-Avatar-6.jpg
#==========================================================================================================================
# Adicionar o checkbox e adicionar na label
    Click                         (//li)[13]//a 
    Click                         //input[@label="blah"]
    Click                         //input[@label="blah"]/../..//button
    Wait For Elements State       //p[text()="It's gone!"]        visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]
    Fill Text                     //input[@type="text"]    Teste de checkbox
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="It's gone!"]        not visible        timeout= 5s
    Take Screenshot    
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]
    Fill Text                     //input[@type="text"]    Teste de checkbox 2
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="It's gone!"]        not visible        timeout= 5s
    Take Screenshot
    Click                         //input[@type="text"]/..//button
    Wait For Elements State       //p[text()="blah"]        visible        timeout= 5s
    Take Screenshot
#==========================================================================================================================
Testar Ambientes Com Links Diferentes    
    Click                         (//li)[14]//a  
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
Testar Ambientes Com Links Diferentes 2    
    Click                         (//li)[14]//a    
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]    visible    timeout= 5s
    Take Screenshot
Fechar modal na tela
    Click                         (//li)[15]//a
    Wait For Elements State      //div[@class="modal"]    visible    timeout= 5s
    Take Screenshot
    Click                         //button[@class="close"]
    Wait For Elements State      //div[@class="modal"]    not visible    timeout= 5s
    Take Screenshot
Teste de formulario de autenticação
    Click                         (//li)[21]//a        
    Fill Text                     //input[@id="username"]    admin
    Fill Text                     //input[@id="password"]    admin
    Click                         //button[@type="submit"]
    Wait For Elements State       //div[@id="flash"]    visible    timeout= 5s
    Take Screenshot
    Should Contain               //div[@id="flash"]    You logged into a secure area!
Teste de perfil
    Click                         (//li)[22]//a
    Wait For Elements State       //h4[text()="Welcome to the Secure Area. When you are done click logout below."]
    Take Screenshot                
    Click                         //a[@href="/logout"]
    Wait For Elements State       //h2[text()="Login Page"]    visible    timeout= 5s
    Take Screenshot    
    Should Contain               //h2[text()="Login Page"]    Login Page
Escrolar pagina como teste de funcionalidade    
    Click                         (//li)[23]//a        
    Scroll To
    Sleep                         3s
    Take Screenshot    
Adicionar numero no input
    Click                         (//li)[24]//a
    Wait For Elements State       //input[@type="number"]
    Take Screenshot    
    Fill Text                     //input[@type="number"]    10
    Take Screenshot    
    Click                         //button[@type="submit"]
    Wait For Elements State       //p[text()="You entered: 10"]    visible    timeout= 5s
    Take Screenshot
    Should Contain               //p[text()="You entered: 10"]    You entered: 10
#==========================================================================================================================
Adicionar numero no input  
    Click                         (//li)[27]//a  
    Wait For Elements State       //input[@type="number"]
    Take Screenshot
    Fill Text                     //input[@type="number"]            10
    Take Screenshot
    Click                         //button[@type="submit"]
    Wait For Elements State       //p[text()="You entered: 10"]     visible     timeout= 5s
    Take Screenshot
    Should Contain               //p[text()="You entered: 10"]     You entered: 10
    Take Screenshot
#==========================================================================================================================    
Testar Ambientes Com Links Diferentes 3
    Click                         (//li)[14]//a  
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
Testar Ambientes Com Links Diferentes 4    
    Click                         (//li)[14]//a
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
Fechar modal na tela 2
    Click                         (//li)[15]//a        
    Wait For Elements State      //div[@class="modal"]     visible     timeout= 5s
    Take Screenshot
    Click                         //button[@class="close"]
    Wait For Elements State      //div[@class="modal"]     not visible     timeout= 5s
    Take Screenshot
#==========================================================================================================================
Teste de formulario de autenticação 2
    Click                         (//li)[21]//a        
    Fill Text                     //input[@id="username"]     admin
    Fill Text                     //input[@id="password"]     admin
    Click                         //button[@type="submit"]
    Wait For Elements State       //div[@id="flash"]     visible     timeout= 5s
    Take Screenshot
    Should Contain               //div[@id="flash"]     You logged into a secure area!
Teste de perfil 2
    Click                         (//li)[22]//a        
    Wait For Elements State       //h4[text()="Welcome to the Secure Area. When you are done click logout below."]
    Take Screenshot
    Click                         //a[@href="/logout"]
    Wait For Elements State       //h2[text()="Login Page"]     visible     timeout= 5s
    Take Screenshot    
    Should Contain               //h2[text()="Login Page"]     Login Page
Escrolar pagina como teste de funcionalidade 2
    Click                         (//li)[23]//a        
    Scroll To
    Sleep                         3s
    Take Screenshot
Adicionar numero no input 2
    Click                         (//li)[24]//a    
    Wait For Elements State       //input[@type="number"]
    Take Screenshot
    Fill Text                     //input[@type="number"]     10
    Take Screenshot    
    Click                         //button[@type="submit"]
    Wait For Elements State       //p[text()="You entered: 10"]     visible     timeout= 5s
    Take Screenshot
    Should Contain               //p[text()="You entered: 10"]     You entered: 10
#==========================================================================================================================
Adicionar numero no input 2    
    Click                         (//li)[27]//a  
    Wait For Elements State       //input[@type="number"]
    Take Screenshot
    Fill Text                     //input[@type="number"]            10
    Take Screenshot
    Click                         //button[@type="submit"]
    Wait For Elements State       //p[text()="You entered: 10"]     visible     timeout= 5s
    Take Screenshot
    Should Contain               //p[text()="You entered: 10"]     You entered: 10
    Take Screenshot
#==========================================================================================================================
Testar Ambientes Com Links Diferentes 3    
    Click                         (//li)[14]//a  
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
Testar Ambientes Com Links Diferentes 4
    Click                         (//li)[14]//a
    Click                         //a[@href="/dynamic_loading/2"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
    Click                         //a[@href="/dynamic_loading/1"]
    Click                         //div[@id="start"]//button
    Wait For Elements State       //h4[text()="Hello World!"]     visible     timeout= 5s
    Take Screenshot
Fechar modal na tela 2
    Click                         (//li)[15]//a            
    Wait For Elements State      //div[@class="modal"]     visible     timeout= 5s
    Take Screenshot
    Click                         //button[@class="close"]
    Wait For Elements State      //div[@class="modal"]     not visible     timeout= 5s
    Take Screenshot
#==========================================================================================================================