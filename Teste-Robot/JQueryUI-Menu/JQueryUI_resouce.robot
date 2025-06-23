*** Settings ***
Library     Browser
Library     Dialogs
Library     Screenshot
#=========================================================================================================================
*** Variables ***
${BROWSER}                       https://the-internet.herokuapp.com/
 #==========================================================================================================================
*** Keywords ***
Abrir o navegador
    Open Browser                 ${BROWSER}                 chromium                   
    Set Viewport Size            1364                       964                   
Fechar o navegador 
    Take Screenshot
    Close Browser
Entrar na pagina JqueryUI clicar nos raidos botoes
    Click                        (//li)[28]//a 
    Click                        //a[@href="http://api.jqueryui.com/menu/"]
    click                        //a[@href="https://jqueryui.com/themeroller/"]
    Fill Text                    //input[@class="ui-autocomplete-input"]                      Marco Aurelio
    Wait For Elements State      //h2[@class="demoHeaders" and text()="Button"]               visible         timeout=3s
    click                        //button[@id="button"]
    click                        //button[@id="button-icon"]
    Wait For Elements State      //h2[@class="demoHeaders" and text()="Checkboxradio"]        visible         timeout=3s
    click                        (//div[@id="radioset"]//span[@class="ui-checkboxradio-icon ui-corner-all ui-icon ui-icon-background ui-icon-blank"])[1]
    Click                        (//div[@id="radioset"]//span[@class="ui-checkboxradio-icon ui-corner-all ui-icon ui-icon-background ui-icon-blank"])[2]
    Click                        (//div[@id="radioset"]//span[@class="ui-checkboxradio-icon ui-corner-all ui-icon ui-icon-background ui-icon-blank"])[3]
    Wait For Elements State      //h2[@class="demoHeaders" and text()="Controlgroup"]         visible         timeout=3s
    Click                        (//div[@id="controlgroup"]//span)[1]
    Click                        (//div[@id="controlgroup"]//span)[3]
    Click                        (//div[@id="controlgroup"]//span)[5]
    Click                        //button[@class="ui-widget ui-controlgroup-item ui-button ui-corner-right"]
Conferir as tabs da pagina
    Wait For Elements State      //h2[@class="demoHeaders" and text()="Tabs"]                 visible         timeout=3s 
    Click                        (//div[@id="tabs"]//ul//li)[1]
    Click                        (//div[@id="tabs"]//ul//li)[2]  
    Click                        (//div[@id="tabs"]//ul//li)[3]  
    Wait For Elements State      //h2[@class="demoHeaders" and text()="Dialog"]                 visible         timeout=3s
    Click                        //button[@id="dialog-link"]
    Click                        //button[@type="button" and text()="Ok"]   
    Wait For Elements State      //h2[@class="demoHeaders" and text()="Framework Icons (content color preview)"]                 visible         timeout=3s 
    Click                        (//li[@class="ui-state-default ui-corner-all"])[1]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[3]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[6]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[9]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[12]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[15]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[18]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[21]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[24]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[27]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[30]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[33]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[39]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[46]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[49]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[53]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[59]
    Click                        (//li[@class="ui-state-default ui-corner-all"])[68]


