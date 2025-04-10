*** Settings ***
Documentation    This test is to validate login page
Library          SeleniumLibrary
Library          Collections
Test Setup       Open the browser and hit the url
Resource         ../resources/resources.robot
Resource        ../resources/common-resources.robot
Resource        ../page-objects/dashboard-page.robot
Resource        ../page-objects/login-page.robot

*** Variables ***
${username}    rahulshettyacademy
${password}    learning
${password_invalid}    learning12

*** Test Cases ***
Validate unsuccessful login
    [Tags]    SMOKE
    Fill in the login form    ${username}    ${password_invalid}
    validate incorrect login attempt
    Log    Unsuccessful login test successful

Validate successful login
    [Tags]    SMOKE    REGRESSION
    Fill in the login form    ${username}    ${password}
    Wait until locator element is visible    ${dashboard_title_locator}
    Element Text Should Be    ${dashboard_title_locator}    ProtoCommerce Home
    Log    Login Successful

Validate products listed on the dashboard page
    Fill in the login form    ${username}    ${password}
    ${expected_products_list}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    Wait until locator element is visible    ${dashboard_title_locator}
    ${actual_products_list}=    Validate products listed on the dashboard page
    Lists Should Be Equal    ${actual_products_list}    ${expected_products_list}
    Select product add to cart button    Nokia Edge

Select the form and navigate to child window
    Fill the login details and select the user option
    Wait Until Element Is Visible    ${dashboard_title_locator}
    Element Text Should Be    ${dashboard_title_locator}    ProtoCommerce Home
    Test Teardown