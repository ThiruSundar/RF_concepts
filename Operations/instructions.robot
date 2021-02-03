*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Operations/instructions.robot
Resource  ../Operations/variables.robot
*** Keywords ***
#    [Arguments]     DONE
#    [Documentation] DONE
#    [Return]        DONE
#    [Tags]          DONE
#    [Teardown]      DONE
#    [Timeout]       DONE 
Open URL through browser
    [Documentation]  This test case opens the browser
    Open Browser  ${url}  ${brows}  #opens the browser 
    Maximize Browser Window  #Maximize the browser
    sleep  2s
Close the browser
    sleep  5s    
    Close Browser    #closes the browser
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

Title Verification for return Trial
    [Arguments]  ${Userurl}  ${InputBrowser}
    Open Browser  ${Userurl}  ${InputBrowser}
    Maximize Browser Window
    ${Title} =  Get Title
    [Return]  ${Title}