*** Settings ***
Library         Browser
Library         Collections
Library         String
Library         OperatingSystem
Resource         ./google_resource.robot 
Resource         ./GLOBAL_KEYWORDS.robot
Resource         ./TEST_GLOBAL.robot
Resource         ./JQueryUI_resouce.robot

Documentation    Esta suíte testa a página de teste the-internet.herokuapp.com
Test Setup       Open Browser    https://the-internet.herokuapp.com
Test Teardown    Close Browser



*** Variables ***
${DEFAULT_TIMEOUT}    5s

*** Keywords ***

 
Go To Page
    [Documentation]    Acessa uma URL dentro do navegador já aberto.
    [Arguments]    ${url}
    Go To    ${url}

Login With Credentials
    [Documentation]    Realiza login preenchendo usuário, senha e clicando no botão de login.
    [Arguments]    ${username}    ${password}    ${username_selector}    ${password_selector}    ${button_selector}
    Fill Text    ${username_selector}    ${username}
    Fill Text    ${password_selector}    ${password}
    Click        ${button_selector}

Wait For Element Visible
    [Documentation]    Aguarda até que um elemento esteja visível.
    [Arguments]    ${selector}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    visible    timeout=${timeout}

Wait For Element Enabled
    [Documentation]    Aguarda até que um elemento esteja habilitado (enabled).
    [Arguments]    ${selector}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    enabled    timeout=${timeout}

Wait For URL Contains
    [Documentation]    Aguarda até que a URL contenha determinado texto.
    [Arguments]    ${text}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For URL    *${text}*    timeout=${timeout}

Click Element
    [Documentation]    Clica em um elemento identificado por seletor.
    [Arguments]    ${selector}
    Click    ${selector}

Fill Field
    [Documentation]    Preenche um campo de texto com valor informado.
    [Arguments]    ${selector}    ${text}
    Fill Text    ${selector}    ${text}

Validate Text Present
    [Documentation]    Valida se o texto está presente na página.
    [Arguments]    ${text}
    Get Text    text=${text}

Validate Page Title
    [Documentation]    Compara o título da página com o esperado.
    [Arguments]    ${expected_title}
    ${title}=    Get Title
    Should Be Equal    ${title}    ${expected_title}

Select Option By Value
    [Documentation]    Seleciona uma opção em um dropdown pelo valor.
    [Arguments]    ${selector}    ${value}
    Select Options By Value    ${selector}    ${value}

Select Option By Label
    [Documentation]    Seleciona uma opção em um dropdown pelo texto visível.
    [Arguments]    ${selector}    ${label}
    Select Options By Label    ${selector}    ${label}

Take Screenshot
    [Documentation]    Captura uma imagem da tela.
    [Arguments]    ${name}=screenshot
    Take Screenshot    ${name}.jpg

Check Element Exists
    [Documentation]    Verifica se o elemento existe na página.
    [Arguments]    ${selector}
    ${state}=    Get Element States    ${selector}
    Should Contain    ${state}    attached

Check Text Exists
    [Documentation]    Verifica se o texto está visível na página.
    [Arguments]    ${text}
    Get Text    text=${text}

Wait For Text
    [Documentation]    Aguarda até que o texto esteja visível.
    [Arguments]    ${text}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    text=${text}    visible    timeout=${t imeout}
wait for invisible text
    [Documentation]    Aguarda até que o texto não esteja mais visível.
    [Arguments]    ${text}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    text=${text}    not visible    timeout=${timeout}
Click By Text
    [Documentation]    Clica em um elemento usando o texto visível.
    [Arguments]    ${text}
    Click    text=${text}

Fill Multiple Fields
    [Documentation]    Preenche múltiplos campos. Envie uma lista de pares [seletor, texto].
    [Arguments]    @{fields}
    FOR    ${field}    IN    @{fields}
        Fill Text    ${field}[0]    ${field}[1]
    END

Scroll To Element
    [Documentation]    Rola a página até um determinado elemento.
    [Arguments]    ${selector}
    Scroll To Element    ${selector}

Accept Alert
    [Documentation]    Aceita um alerta (popup).
    Handle Dialog    action=accept

Reject Alert
    [Documentation]    Rejeita um alerta (popup).
    Handle Dialog    action=reject

Wait And Click
    [Documentation]    Espera o elemento ficar visível e clica nele.
    [Arguments]    ${selector}
    Wait For Element Visible    ${selector}
    Click Element                ${selector}
Take Screenshot If Element Exists
    [Documentation]    Tira um screenshot se o elemento existir.        
    [Arguments]    ${selector}
    ${exists}=    Run Keyword And Return Status    Check Element Exists    ${selector}
    Run Keyword If    ${exists}    Take Screenshot    ${selector}_screenshot
    Run Keyword If    not ${exists}    Log    Elemento não encontrado: ${selector}
Take Screenshot If Text Exists
    [Documentation]    Tira um screenshot se o texto existir na página.
    [Arguments]    ${text}
    ${exists}=    Run Keyword And Return Status    Check Text Exists    ${text}
    Run Keyword If    ${exists}    Take Screenshot    ${text}_screenshot
    Run Keyword If    not ${exists}    Log    Texto não encontrado: ${text}
Take Screenshot If URL Contains
    [Documentation]    Tira um screenshot se a URL contiver o texto especificado.
    [Arguments]    ${text}
    ${exists}=    Run Keyword And Return Status    Wait For URL Contains    ${text}
    Run Keyword If    ${exists}    Take Screenshot    ${text}_screenshot
    Run Keyword If    not ${exists}    Log    URL não contém: ${text}
 Take Screenshot If Element Enabled
    [Documentation]    Tira um screenshot se o elemento estiver habilitado.    
    [Arguments]    ${selector}
    ${enabled}=    Run Keyword And Return Status    Wait For Element Enabled    ${selector}
    Run Keyword If    ${enabled}    Take Screenshot    ${selector}_enabled_screenshot
    Run Keyword If    not ${enabled}    Log    Elemento não está habilitado: ${selector}
Take Screenshot If Element Disabled
    [Documentation]    Tira um screenshot se o elemento estiver desabilitado.
    [Arguments]    ${selector}
    ${disabled}=    Run Keyword And Return Status    Wait For Element Enabled    ${selector}    timeout=0s
    Run Keyword If    not ${disabled}    Take Screenshot    ${selector}_disabled_screenshot
    Run Keyword If    ${disabled}    Log    Elemento está habilitado: ${selector}    
Take Screenshot If Element Contains Text
    [Documentation]    Tira um screenshot se um elemento contiver texto específico.
    [Arguments]    ${selector}    ${text}
    ${contains}=    Run Keyword And Return Status    Get Text    text=${text}
    Run Keyword If    ${contains}    Take Screenshot    ${selector}_${text}_contains_screenshot
    Run Keyword If    not ${contains}    Log    Elemento não contém texto: ${selector} com texto ${text}
Take Screenshot If Element Does Not Contain Text
    [Documentation]    Tira um screenshot se um elemento não contiver texto específico.
    [Arguments]    ${selector}    ${text}
    ${contains}=    Run Keyword And Return Status    Get Text    text=${text}
    Run Keyword If    not ${contains}    Take Screenshot    ${selector}_${text}_not_contains_screenshot
    Run Keyword If    ${contains}    Log    Elemento contém texto: ${selector} com texto ${text}  
Take Screenshot If Element Has Attribute
    [Documentation]    Tira um screenshot se um elemento tiver um atributo específico.
    [Arguments]    ${selector}    ${attribute}
    ${has_attr}=    Run Keyword And Return Status    Get Element Attribute    ${selector}    ${attribute}
    Run Keyword If    ${has_attr}    Take Screenshot    ${selector}_${attribute}_has_attribute_screenshot
    Run Keyword If    not ${has_attr}    Log    Elemento não tem o atributo: ${selector} com atributo ${attribute}
Take Screenshot If Element Does Not Have Attribute
    [Documentation]    Tira um screenshot se um elemento não tiver um atributo específico.    
    [Arguments]    ${selector}    ${attribute}
    ${has_attr}=    Run Keyword And Return Status    Get Element Attribute    ${selector}    ${attribute}
    Run Keyword If    not ${has_attr}    Take Screenshot    ${selector}_${attribute}_not_has_attribute_screenshot
    Run Keyword If    ${has_attr}    Log    Elemento tem o atributo: ${selector} com atributo ${attribute}  
Take Screenshot If Element Is Visible
    [Documentation]    Tira um screenshot se um elemento estiver visível.    
    [Arguments]    ${selector}
    ${visible}=    Run Keyword And Return Status    Wait For Element Visible    ${selector}        
    Run Keyword If    ${visible}    Take Screenshot    ${selector}_visible_screenshot
    Run Keyword If    not ${visible}    Log    Elemento não está visível: ${selector}
Take Screenshot If Element Is Not Visible
    [Documentation]    Tira um screenshot se um elemento não estiver visível.
    [Arguments]    ${selector}
    ${visible}=    Run Keyword And Return Status    Wait For Element Visible    ${selector}    timeout=0s
    Run Keyword If    not ${visible}    Take Screenshot    ${selector}_not_visible_screenshot
    Run Keyword If    ${visible}    Log    Elemento está visível: ${selector}
Take Screenshot If Element Is Enabled
    [Documentation]    Tira um screenshot se um elemento estiver habilitado.
    [Arguments]    ${selector}
    ${enabled}=    Run Keyword And Return Status    Wait For Element Enabled    ${selector}
    Run Keyword If    ${enabled}    Take Screenshot    ${selector}_enabled_screenshot
    Run Keyword If    not ${enabled}    Log    Elemento não está habilitado: ${selector}     
Take Screenshot If Element Is Required
    [Documentation]    Tira um screenshot se um elemento for obrigatório.    
    [Arguments]    ${selector}
    ${required}=    Run Keyword And Return Status    Get Element Attribute    ${selector}    required
    Run Keyword If    ${required}    Take Screenshot    ${selector}_required_screenshot    
    Run Keyword If    not ${required}    Log    Elemento não é obrigatório: ${selector}
Take Screenshot If Element Is Not Required
    [Documentation]    Tira um screenshot se um elemento não for obrigatório.
    [Arguments]    ${selector}
    ${required}=    Run Keyword And Return Status    Get Element Attribute    ${selector}    required
    Run Keyword If    not ${required}    Take Screenshot    ${selector}_not_required_screenshot
    Run Keyword If    ${required}    Log    Elemento é obrigatório: ${selector} 
Take Screenshot If Element Has Title
    [Documentation]    Tira um screenshot se um elemento tiver um título (title).    
    [Arguments]    ${selector}
    ${title}=    Run Keyword And Return Status    Get Element Attribute    ${selector}    title
    Run Keyword If    ${title}    Take Screenshot    ${selector}_has_title_screenshot    
    Run Keyword If    not ${title}    Log    Elemento não tem título: ${selector}                                     
Take Screenshot If Element Has Attribute
    [Documentation]    Tira um screenshot se um elemento tiver um atributo específico.    
    [Arguments]    ${selector}    ${attribute}
    ${has_attr}=    Run Keyword And Return Status    Get Element Attribute    ${selector}    ${attribute}
    Run Keyword If    ${has_attr}    Take Screenshot    ${selector}_${attribute}_has_attribute_screenshot
    Run Keyword If    not ${has_attr}    Log    Elemento não tem o atributo: ${selector} com atributo ${attribute}
Take Screenshot If Element Does Not Have Attribute
    [Documentation]    Tira um screenshot se um elemento não tiver um atributo específico.
    [Arguments]    ${selector}    ${attribute}
    ${has_attr}=    Run Keyword And Return Status    Get Element Attribute    ${selector}    ${attribute}
    Run Keyword If    not ${has_attr}    Take Screenshot    ${selector}_${attribute}_not_has_attribute_screenshot
    Run Keyword If    ${has_attr}    Log    Elemento tem o atributo: ${selector} com atributo ${attribute}    
select Option By Value
    [Documentation]    Seleciona uma opção em um dropdown pelo valor.
    [Arguments]    ${selector}    ${value}
    Select Options By Value    ${selector}    ${value}
select Option By Label
    [Documentation]    Seleciona uma opção em um dropdown pelo texto visível.    
    [Arguments]    ${selector}    ${label}
    Select Options By Label    ${selector}    ${label}
Wait For Elements State
    [Documentation]    Aguarda até que os elementos estejam em um determinado estado.    
    [Arguments]    ${selector}    ${state}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    ${state}    timeout=${timeout}
click web element
    [Documentation]    Clica em um elemento web usando o seletor.
    [Arguments]    ${selector}
    Click Element    ${selector}
fill web element
    [Documentation]    Preenche um elemento web com o texto fornecido.    
    [Arguments]    ${selector}    ${text}
    Fill Text    ${selector}    ${text}
wait for element to be visible
    [Documentation]    Aguarda até que um elemento esteja visível na página.
    [Arguments]    ${selector}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    visible    timeout=${timeout}
wait for element to be enabled
    [Documentation]    Aguarda até que um elemento esteja habilitado (enabled).
    [Arguments]    ${selector}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    enabled    timeout=${timeout}
wait for element to be disabled
    [Documentation]    Aguarda até que um elemento esteja desabilitado (disabled).    
    [Arguments]    ${selector}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    disabled    timeout=${timeout}
wait for element to contain text
    [Documentation]    Aguarda até que um elemento contenha o texto especificado.
    [Arguments]    ${selector}    ${text}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    text=${text}    timeout=${timeout}
wait for element to not contain text
    [Documentation]    Aguarda até que um elemento não contenha o texto especificado.
    [Arguments]    ${selector}    ${text}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    not text=${text}    timeout=${timeout}
Click Web Element By Text
    [Documentation]    Clica em um elemento web usando o texto visível.
    [Arguments]    ${text}
    Click    text=${text}
select option by value
    [Documentation]    Seleciona uma opção em um dropdown pelo valor.
    [Arguments]    ${selector}    ${value}
    Select Options By Value    ${selector}    ${value}
select option by label
    [Documentation]    Seleciona uma opção em um dropdown pelo texto visível.
    [Arguments]    ${selector}    ${label}
    Select Options By Label    ${selector}    ${label}    
wait for element to be present
    [Documentation]    Aguarda até que um elemento esteja presente na página.
    [Arguments]    ${selector}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait For Elements State    ${selector}    attached    timeout=${timeout}    
        
 