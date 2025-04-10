*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Test Data
${expected_error_msg}    Invalid credentials

*** Keywords ***


#Radio button/select dropdown option/select checkbox
Fill the login details and select the user option
    Wait Until Element Is Visible    ${username_locator}
    Input Text    ${username_locator}       ${username}
    Input Password    ${password_locator}    ${password}
    Click Element    xpath://input[@value='user']
    Select From List By Value    xpath://select[@class='form-control']    teach
    Wait Until Element Is Visible    okayBtn
    Click Element    okayBtn
#    Click Button    terms
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    Click Button    ${login_button_locator}

Test Teardown
    Close Browser

