*** Settings ***
Documentation        User login tests

Resource        ${EXECDIR}/resources/Base.robot

*** Test Cases ***

User Login
#antigo    &{payload}        Create Dictionary        
#    ...               email=leogama@gmail.com        
#    ...               password=123456
    
    ${payload}        Get Json        sessions        user_login.json

    ${response}             POST Login     ${payload}
    Status Should Be        200            ${response}

    ${token}        Set Variable        ${response.json()}[user_token]
    Length Should Be        ${token}        24    


