*** Settings ***
Documentation        Signup Attemp Tests - Suits

Resource             ${EXECDIR}/resources/Base.robot
Test Template        Attempt Signup

*** Test Cases ***        scenario                   message

Empty Name                empty_name            required name
Empty Email               empty_email           required email
Empty Password            empty_pass            required password    
Without Name              whitout_name          required name  
Wrong Email               wrong_email           wrong email


*** Keywords ***

#testes orientados a dados >
Attempt Signup

    [Arguments]        ${scenario}        ${message}
    
    ${attempt}         Get Json            signup        attempt.json

    ${response}             POST User          ${attempt['${scenario}']}     
    Status Should Be        412                ${response}  
    Should Be Equal         ${message}         ${response.json()}[error]