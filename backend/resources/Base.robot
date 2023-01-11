*** Settings ***
Documentation        Arquivo de configuração

Library    RequestsLibrary

Resource    routes/Sessions.robot
Resource    Helpers.robot

*** Variables ***

${base_url}        https://rocklov-api-gama.fly.dev