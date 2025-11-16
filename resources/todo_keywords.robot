*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://todomvc.com/examples/react/dist/

*** Keywords ***
Abrir Aplicacao
    Open Browser    ${URL}    chrome
    Wait Until Page Contains Element    css:input.new-todo

Fechar Aplicacao
    Close All Browsers

Adicionar Atividade
    [Arguments]    ${atividade}
    Input Text    css:input.new-todo    ${atividade}
    Press Keys    css:input.new-todo    RETURN
    Wait Until Page Contains    ${atividade}

Marcar Como Concluida
    [Arguments]    ${atividade}
    ${locator} =    Set Variable    xpath=//li[.//label[text()='${atividade}']]//input[@type="checkbox"]
    Click Element    ${locator}

Excluir Atividade
    [Arguments]    ${atividade}
    ${locator} =    Set Variable    xpath=//li[.//label[text()='${atividade}']]//button[@class="destroy"]
    Mouse Over    xpath=//li[.//label[text()='${atividade}']]
    Click Element    ${locator}

Filtrar Atividades Concluidas
    Click Element    link:Completed

Limpar Atividades Concluidas
    Click Element    css:button.clear-completed

Verificar Atividade Visivel
    [Arguments]    ${atividade}
    Wait Until Page Contains    ${atividade}

Verificar Atividade Nao Visivel
    [Arguments]    ${atividade}
    Wait Until Page Does Not Contain    ${atividade}

Verificar Lista Vazia
    Wait Until Page Does Not Contain Element    css:ul.todo-list li