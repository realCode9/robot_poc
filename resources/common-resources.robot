*** Settings ***
Library        SeleniumLibrary

*** Variables ***
#LOCATORS
${username_locator}    xpath://input[@id='username']
${password_locator}    xpath://input[@id='password']
${login_button_locator}    xpath://input[@id='signInBtn']

#DATA VARIABLES
${url}    https://rahulshettyacademy.com/loginpagePractise/
${browser_name}    Chrome


*** Keywords ***
open the browser and hit the url
    Create Webdriver    ${browser_name}
    Go To    ${url}
    
Wait until locator element is visible
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Fill in the login form
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${password_locator}
    Input Text    ${username_locator}       ${username}
    Input Password    ${password_locator}    ${password}
    Click Button    ${login_button_locator}

Wait until button visible and click button
    [Arguments]    ${button_locator}
    Wait Until Element Is Visible    ${button_locator}
    Click Button    ${button_locator}

Wait until link visible and click link
    [Arguments]    ${element_locator}
    Wait Until Element Is Visible    ${element_locator}
    Click Link    ${element_locator}

Wait until element will disappear
    [Arguments]    ${element_locator}
    Wait Until Element Is Not Visible    ${element_locator}

Add input to the field
    [Arguments]    ${input_locator}    ${input_value}
    Wait Until Element Is Visible    ${input_locator}
    Input Text    ${input_locator}    ${input_value}

