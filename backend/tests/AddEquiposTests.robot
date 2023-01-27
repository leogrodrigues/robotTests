*** Settings ***
Documentation        Add Equipos Tests - Suits

Resource             ${EXECDIR}/resources/Base.robot

*** Test Cases ***
Add New Equipo

    ${token}        Get token        gama@gama.com        pwd123

    ${equipo}        Get Json     equipos        fender.json

    Remove Equipo        ${equipo}[payload][name]

    ${response}        POST Equipos        ${equipo}        ${token}       

    Status Should Be        200        ${response}
