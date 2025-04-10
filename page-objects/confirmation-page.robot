*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common-resources.robot


*** Variables ***
#LOCATORS
${country_input_locator}           country
${country_ellipsis_locator}        css:.lds-ellipsis
${checkbox_locator}                css:.checkbox label
#${country_name_locator}            xpath://div[@class='suggestions']/ul/li/a
${purchase_button}                 css:.btn-success
${success_message_locator}         css:.alert-success

#TEST DATA
${country_value}    India

*** Keywords ***
Wait and click the link
    Sleep    3
    Wait until link visible and click link    xpath://a[text()='${country_value}']
    
Wait for checkbox and click
    Wait Until Button Visible And Click Button    ${checkbox_locator}
