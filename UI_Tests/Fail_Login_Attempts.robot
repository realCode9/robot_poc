*** Settings ***
Documentation    This test is to validate login page
Library          SeleniumLibrary
Library          Collections
Test Setup       Open the browser and hit the url
Test Template    Validate unsuccessful login
Resource         ../resources/resources.robot
Resource         ../resources/common-resources.robot
Resource         ../page-objects/login-page.robot


*** Test Cases ***    username_value    invalid_password_value
invalid username        esders            learning
invalid password        address@login     learning
special characters        21@23@#32#    learing#$%#

*** Keywords ***
Validate unsuccessful login
    [Arguments]    ${username_value}    ${invalid_password_value}
    Fill in the login form    ${username_value}    ${invalid_password_value}
    validate incorrect login attempt
    Log    Unsuccessful login test successful
    Test Teardown