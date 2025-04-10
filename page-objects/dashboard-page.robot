*** Settings ***
Library            SeleniumLibrary
Library            Collections

*** Variables ***
${dashboard_title_locator}            //a[normalize-space()='ProtoCommerce Home']

*** Keywords ***
#Dynamic keyword to select product add to cart button based on provided product name as argument
Select product add to cart button
    [Arguments]    ${productName}
    ${products}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${product}    IN    @{products}
        Exit For Loop If    '${product.text}' == '${productName}'
        ${index}=    Evaluate    ${index} + 1
    END

    Click Button    xpath:(//div[@class='card-footer'])[${index}]/button

Validate products listed on the dashboard page
    ${elements}=    Get WebElements    css:.card-title
    ${actualList}=    Create List
    FOR        ${element}        IN        @{elements}
        ${text}=        Get Text        ${element}
        Log        ${text}
        Append To List    ${actualList}    ${text}
    END
    Log        ${actualList}
    RETURN    ${actualList}