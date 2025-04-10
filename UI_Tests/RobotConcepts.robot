*** Settings ***
Documentation    This test is to validate login page
Library          SeleniumLibrary
Library          Collections
Library          String
Test Setup       Open the browser and hit the url
Resource         ../resources/resources.robot
Resource    ../resources/common-resources.robot

*** Variables ***
${emailFromString}
#Test includes - Handling new window    ||    Parsing string    ||    Switch to parent Window

*** Test Cases ***
Validate child window functionality
    Click on child window opening link
    Switch to child window
    Grab the email from child window
    Switch to parent window to enter email in the field

*** Keywords ***
Click on child window opening link
    Sleep    5
    Click Element    css:.blinkingText
    

Switch to child window
    Switch Window    NEW
    Sleep    5
    Element Text Should Be    css:.inner-box    DOCUMENTS REQUEST

Grab the email from child window
    ${redText}    Get Text    css:.red
    Log    ${redText}
    ${stringList}=    Split String    ${redText}    at
    ${emailPart}=   Get From List    ${stringList}    1
    Log    ${emailPart}
    ${finalList}    Split String    ${emailPart}
    ${emailFromString}=    Get From List    ${finalList}    0
    Set Global Variable    ${emailFromString}

Switch to parent window to enter email in the field
    Switch Window    MAIN
    Element Should Be Visible    username
    Input Text    id:username    ${emailFromString}