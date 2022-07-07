***Settings***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Resource    ../keywords/keywords.robot
Resource    ../objects_repository/locators.robot
Resource    ../variables/variables.robot

***Keywords***
Fill Login Form
    [Arguments]     ${user_name}        ${password}
    Input text              ${user_name_locator}        ${user_name}
    Input password          ${password_locator}         ${password}
    Click Button            ${login_button_locator}
    Capture Page Screenshot
  

Varify That User Logged
    Wait Until Element is Visible   ${logout_link}

Verify that user is not logged
    Wait Until Element is Visible       ${login_failed_button_locator}

Launch application
    Create Webdriver        ${browser}
    Maximize Browser Window
    Go to                   ${url}
    # Sleep   3m

Take a snapshot
    Click button        //button[(@id='clear-snapshots-button' and @class='btn btn-secondary btn-sm')]

Move to Playback page
    Wait until element is Visible       ${playback_page}  7s
    Click element        ${playback_page}
    Capture Page Screenshot

Get snapshots list
    ${count} =	Get Element Count	//ul[@id="recordings-list"]/li
    @{snapshots} =	Create List
    FOR    ${index}      IN RANGE        1       ${count}+1
        ${snapshot}    Get Element Attribute	//ul[@id="recordings-list"]/li[${index}]	    data-recording-name
        Append To List	${snapshots}	${snapshot}
    END

# Get recordings list
#     ${count} =	Get Element Count	//ul[@id="recordings-list"]/li
#     @{recordings} =	Create List
#     FOR    ${index}      IN RANGE        1       ${count}+1
#         ${recording}    Get Element Attribute	//ul[@id="recordings-list"]/li[${index}]	    data-recording-name
#         Append To List	${recordings}	${recording}
#     END

Clean existing snapshots
    # Scroll Element Into View    //button[@id="clear-snapshots-button"]
    Wait Until Element Is Enabled    //button[@id="clear-snapshots-button"]    5s
    Cover Element    //button[@id="clear-snapshots-button"]
    Capture Page Screenshot
    Press Keys      none        ARROW_DOWN
    Press Keys      none        ARROW_DOWN
    Press Keys      none        ARROW_DOWN
    Press Keys      none        ARROW_DOWN
    Press Keys      none        ARROW_DOWN
    Press Keys      none        ARROW_DOWN
    # Sleep    5s
    # Press Keys      none        TAB
    # Press Keys      none        TAB
    # Press Keys      none        SPACE
    # Cover element   //button[@id="clear-snapshots-button"]
    # Capture Page Screenshot
    # Click Element At Coordinates    //button[@id="clear-snapshots-button"]      0       -30
    Sleep   5s
    Run Keyword And Ignore Error
    ...         Click Element     //button[@id="clear-snapshots-button"]
    Sleep   5s
    Click Element     //button[@id="clear-snapshots-button"]
    Sleep    5s
    Alert Should Be Present     *       ACCEPT
    #Handle Alert