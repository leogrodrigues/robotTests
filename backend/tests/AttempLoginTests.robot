*** Settings ***
Documentation        Sessions Attemp Login Tests - Suits

Resource             ${EXECDIR}/resources/Base.robot
Test Template        Attempt Login

*** Test Cases ***        json_file                status_code           message

Incorrect Password        incorrect_pass.json         401                Unauthorized
User not found            user_not_found.json         401                Unauthorized
Incorrect email           incorrect_email.json        412                wrong email    
Empty email               empty_email.json            412                required email  


*** Keywords ***

#testes orientados a dados >
Attempt Login

    [Arguments]        ${json_file}        ${status_code}        ${message}

    ${payload}              Get Json            sessions        ${json_file}    
    ${response}             POST Login          ${payload}      
    Status Should Be        ${status_code}      ${response}  
    Should Be Equal         ${message}          ${response.json()}[error]