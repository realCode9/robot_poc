*** Settings ***
Documentation    This test is to validate login page
Library          SeleniumLibrary
Library          Collections
Library          DataDriver    file=data/Login_Data.csv    encoding=utf_8        dialect=unix
Test Setup       Open the browser and hit the url
Test Template    Validate unsuccessful login
Resource         ../resources/resources.robot
Resource         ../resources/common-resources.robot
Resource         ../page-objects/login-page.robot

*** Test Cases ***    
Unsuccessful attempt using user ${username} and password ${password} here    rahulshettyacademy    learning1

*** Keywords ***
Validate unsuccessful login
    [Tags]    SMOKE
    [Arguments]    ${username}    ${password}
    Fill in the login form    ${username}    ${password}
    validate incorrect login attempt
    Log    Unsuccessful login test successful
    Test Teardown