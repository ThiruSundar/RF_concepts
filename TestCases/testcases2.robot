*** Settings ***
Resource  ../Operations/instructions.robot
Resource  ../Operations/variables.robot
Test Timeout  15s

*** Test Cases ***
Trial run 2
    ${res} =  Title Verification for return Trial  ${url}  ${brows}
    Log To Console  ${res}