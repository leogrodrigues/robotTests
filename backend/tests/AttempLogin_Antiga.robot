*** Settings ***
Documentation        Sessions route tests

Resource        ${EXECDIR}/resources/Base.robot

*** Test Cases ***

Incorrect Password
    [Template]        Attempt Login
    incorrect_pass.json         401        Unauthorized



User not found
    ${payload}       Get Json        user_not_found.json  
    
    ${response}        POST Login     ${payload}       
#antigo    ${response}        POST        ${base_url}/sessions               json=${payload}        expected_status=any
    Status Should Be        401        ${response}  

    Should Be Equal        Unauthorized        ${response.json()}[error] 


Incorrect email
    [Template]        Attempt Login
    incorrect_email.json        412        wrong email    

#    ${payload}      Get Json        incorrect_email.json
    
#    ${response}        POST        ${base_url}/sessions               json=${payload}        expected_status=any
#    Status Should Be        412        ${response}  

#    Should Be Equal        wrong email        ${response.json()}[error]   


Empty email
    &{payload}        Create Dictionary        
    ...               email=${EMPTY}        
    ...               password=123      
    
    ${response}        POST        ${base_url}/sessions               json=${payload}        expected_status=any
    Status Should Be        412        ${response}  

    Should Be Equal        required email        ${response.json()}[error]  


*** Keywords ***

#testes orientados a dados >
Attempt Login

    [Arguments]        ${json_file}        ${status_code}        ${message}

    ${payload}              Get Json            ${json_file}    
    ${response}             POST Login          ${payload}      
    Status Should Be        ${status_code}      ${response}  

    Should Be Equal        ${message}          ${response.json()}[error]