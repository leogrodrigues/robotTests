*** Settings ***

Documentation        Signup tests

Library        FakerLibrary

Resource        ${EXECDIR}/resources/Base.robot


*** Test Cases ***

Add New User
    #para massa fixa
    #${payload}        Get Json        signup        new_user.json

    ${email}        FakerLibrary.Free Email

    &{payload}        Create Dictionary        name=Tony Stark        email=${email}        password=pwd123        
    ${response}        POST User        ${payload}

    Status Should Be        200            ${response}

      

