*** Settings ***

Documentation        Aqui teremos as KWs de ajuda

Library    OperatingSystem

*** Keywords ***

Get Json
    [Arguments]        ${route}        ${file_name}

    ${fixture}        Get File        ${EXECDIR}/resources/fixtures/${route}/${file_name}
    ${json}        Evaluate        json.loads($fixture)        json

    [return]        ${json}