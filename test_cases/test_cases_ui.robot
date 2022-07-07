***Settings***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Resource    ../keywords/keywords.robot
Resource    ../objects_repository/locators.robot
Resource    ../variables/variables.robot

Test Setup     Launch application

Test Teardown       Close Browser


***Test Cases***
Login to customer camera
    [Tags]      login_correct
    Fill Login Form         ${user_name}        ${password}
    Varify That User Logged
    #Verify if live view is present

Login to customer camera incorrect username
    [Tags]      login_incorrect
    Fill Login Form         ${user_name_incorrect}        ${password}
    Verify that user is not logged

Clear snapshots confirm and cancel buttons
    [Tags]    snapshot
    Fill Login Form       ${user_name}        ${password}
    Varify That User Logged
    Move to Playback page
    Clean existing snapshots
    #Take a snapshot
    #Choose an image to delete
    #Click on Clear Snapshots (instead of Clear Images)

Clear recordings confirm and cancel buttons
    [Tags]    recording