*** Settings ***

Documentation        Signup tests

Resource        ${EXECDIR}/resources/Base.robot


*** Test Cases ***

Add New User

    &{payload}        Get Json        signup        new_user.json

    ${response}        POST User        ${payload}

    Status Should Be        200            ${response}

    Remove User By Email        ${payload['email']}

      

