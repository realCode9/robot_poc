*** Settings ***
Library    SeleniumLibrary
Library    ../customLibraries/Shop.py
Resource    ../resources/common-resources.robot
Resource    ../page-objects/dashboard-page.robot
Resource    ../page-objects/checkout-page.robot
Resource    ../page-objects/confirmation-page.robot
Test Setup       Open the browser and hit the url

*** Variables ***
${username}    rahulshettyacademy
${password}    learning
@{listOfProducts}    Nokia Edge    Blackberry
${country_ellipsis_locator}        css:.lds-ellipsis


*** Test Cases ***
Using custom libraries created in shop library
    Fill In The Login Form    ${username}    ${password}
    Sleep    5
    Wait until locator element is visible    ${dashboard_title_locator}
    Element Text Should Be    ${dashboard_title_locator}    ProtoCommerce Home
    Add Items To Cart    ${listOfProducts}
#    ${actualProductsOnCheckout}    Verify Checkout Page Products
#    Log    ${actualProductsOnCheckout}

    Wait until button visible and click button    ${checkout_button_locator}
    Add input to the field    ${country_input_locator}    ${country_value}
#    Wait Until Element Will Disappear    ${country_ellipsis_locator}
    Wait and click the link
    Sleep    5
#    Wait for checkbox and click
#    Click Button    xpath://div[@class='checkbox checkbox-primary']//label
    Wait until button visible and click button    ${purchase_button}
    Page Should Contain    Success! Thank you!