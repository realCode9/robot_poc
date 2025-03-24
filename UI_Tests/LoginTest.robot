*** Settings ***
Documentation    This test is to validate login page
Library          SeleniumLibrary


*** Test Cases ***
Validate login with valid username and password
    Log To Console    Hello World
    open the browser and hit the url
    fill the login form
#    click the login button
#    validate incorrect login attempt

*** Keywords ***
open the browser and hit the url
    Create Webdriver    Chrome
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

fill the login form
    Wait Until Element Is Visible    xpath://input[@placeholder='Username']
    Input Text    xpath://input[@placeholder='Username']    Admin
    Wait Until Element Is Visible    xpath://input[@placeholder='Password']
    Input Text    xpath://input[@placeholder='Password']    admin1234
    Click Button    xpath://button[normalize-space()='Login']



