*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Operations/variables.robot
Resource  ../Operations/login_resource.robot


*** Keywords ***
Open URL through browser
    [Documentation]  This test case opens the browser
    Open Browser  ${url1}  ${brows}  #opens the browser 
    Maximize Browser Window  #Maximize the browser
    sleep  2s

Close the browser
    sleep  5s    
    Close Browser    #closes the browser

Input Username
    [Arguments]  ${username}
    Input Text  xpath=//input[@id='Email']  ${username}

Input Password
    [Arguments]  ${password}
    Input Text  xpath=//input[@id='Password']  ${password}

Click login button
    Click Element   xpath=//input[@class='button-1 login-button'] 

Web table Handle
    [Tags]  Functional
    ${table_count_row} =  Get Element Count  xpath=//table[@name='BookTable']/tbody/tr
    Log to Console  ${table_count_row}
    ${table_count_col} =  Get Element Count  xpath=//table[@name='BookTable']/tbody/tr[1]/th
    Log to Console  ${table_count_col}
    FOR  ${i}  IN RANGE  2  ${table_count_row}+1
        ${abc}  for loop keywordss    ${i}
        Exit For Loop If  ${abc} 
    END

for loop keywordss
    [Arguments]    ${ivalue}
    ${table_count_col} =  Get Element Count  xpath=//table[@name='BookTable']/tbody/tr[1]/th
    FOR  ${j}  IN RANGE  1  ${table_count_col}+1
        ${colo} =  Get Text  xpath=//table[@name='BookTable']/tbody/tr[${ivalue}]/td[${j}]
        Run Keyword If  "${colo}" == "${Expected_category}"  Log to Console  ${colo} 
        ${index}    Set Variable    ${true}
        Return From Keyword If    '${colo}' == '${Expected_category}'    ${index}
    END