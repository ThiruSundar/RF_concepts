*** Settings ***
Resource  ../Operations/instructions.robot
#Resource  ../Operations/login_resource.robot
Resource  ../Operations/variables.robot
Test Setup  Open URL through browser
Test Teardown  Close the browser
Documentation  Exploring different sections
*** Test Cases ***
Trial run 1
    [Tags]  Sanity
    Web table Handle