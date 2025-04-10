*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Locators
${error_msg_locator}    css:.alert-danger

*** Keywords ***
validate incorrect login attempt
    Wait Until Element Is Visible    ${error_msg_locator}
    Element Text Should Be    ${error_msg_locator}    Incorrect username/password.