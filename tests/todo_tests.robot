*** Settings ***
Library           SeleniumLibrary
Resource           ../resources/todo_keywords.robot
Test Setup        Abrir Aplicacao
Test Teardown     Fechar Aplicacao

*** Variables ***
${URL}            https://todomvc.com/examples/react/dist/
${BROWSER}        chrome

*** Test Cases ***
Cenário 1 - Adicionar e filtrar atividades concluídas
    Adicionar Atividade    Lavar roupa
    Adicionar Atividade    Estudar Robot
    Adicionar Atividade    Fazer compras
    Marcar Como Concluida  Estudar Robot
    Filtrar Atividades Concluidas
    Verificar Atividade Visivel  Estudar Robot
    Verificar Atividade Nao Visivel  Lavar roupa

Cenário 2 - Excluir atividade concluída
    Adicionar Atividade    Dormir
    Adicionar Atividade    Comer
    Adicionar Atividade    Trabalhar
    Adicionar Atividade    Caminhar
    Marcar Como Concluida  Trabalhar
    Excluir Atividade      Trabalhar
    Filtrar Atividades Concluidas
    Verificar Atividade Nao Visivel  Trabalhar

Cenário 3 - Limpar atividades concluídas
    Adicionar Atividade    Ler
    Adicionar Atividade    Estudar
    Adicionar Atividade    Cozinhar
    Adicionar Atividade    Correr
    Marcar Como Concluida  Correr
    Limpar Atividades Concluidas
    Filtrar Atividades Concluidas
    Verificar Lista Vazia
