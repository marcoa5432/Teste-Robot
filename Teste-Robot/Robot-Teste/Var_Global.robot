*** Settings ***
Resource  ./google_resource.robot
Resource  ./GLOBAL_KEYWORDS.robot
Resource  ./TEST_GLOBAL.robot
Resource  ./google_teste.robot   
                


*** Variables ***
# Teste não identificado ainda 
${BROWSER}              https://the-internet.herokuapp.com/  
${IMAGEM_DESEJADA}      //img[@src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-6.jpg"]
${BOTAO_ATUALIZAR}      //a[text()="click here"]
${MAX_TENTATIVAS}       10
