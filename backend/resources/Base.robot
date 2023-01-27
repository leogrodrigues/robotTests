*** Settings ***
Documentation        Arquivo de configuração

Library    RequestsLibrary
Library    libs/mongo.py

Resource    routes/Sessions.robot
Resource    routes/Signup.robot
Resource    Helpers.robot
Resource    routes/Equipos.robot


*** Variables ***

${base_url}        https://rocklov-api-gama.fly.dev