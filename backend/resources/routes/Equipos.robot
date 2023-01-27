*** Settings ***

Documentation        Implementação da Rota / equipos

Library              OperatingSystem


*** Keywords ***

POST Equipos
    [Arguments]        ${equipo}        ${token}       

    &{headers}        Create Dictionary        user_token=${token}

    ${bin_image}        Get Binary File        ${EXECDIR}/resources/fixtures/equipos/thumbnails/${equipo}[thumb]

    ${thumbnail}        Create Dictionary        thumbnail=${bin_image}

    ${response}        POST                      ${base_url}/equipos           data=${equipo}[payload]
    ...                headers=${headers}        files=${thumbnail}            expected_status=any

    [return]        ${response}