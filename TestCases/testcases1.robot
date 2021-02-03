*** Settings ***
Library  SeleniumLibrary
Resource  ../Operations/variables.robot
Resource  ../Operations/login_resource.robot
Suite Setup  Open URL through browser
Suite Teardown  Close the browser
Test Template  Invalid login

*** Test Cases ***        username        password
correct user empty password  admin@yourstore.com  ${empty}
correct user wrong password  admin@yourstore.com  123456789

*** Keywords ***
Invalid login
    [Arguments]  ${username}  ${password}
    Input Username  ${username}
    Input Password  ${password}
    Click login button


