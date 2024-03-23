# Test - open a browser with Wikipedia ; click on the correct elements ; log in ; search for a phrase ; capture a screenshot.

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${project_path}    C:/path/to/project
${login_to_wikipedia}    <your_login>
${password_to_wikipedia}    <your_password>

*** Keywords ***
WikipediaLoginScope
    [Arguments]    ${login}    ${password}
    Click Element    id:pt-login-2
    Input Text    id:wpName1    ${login}
    Input Password    id:wpPassword1    ${password}
    Select Checkbox    id:wpRemember
    Click Button    id:wpLoginAttempt

*** Test Cases ***
WikipediaTest
    [Documentation]    Test with a login to wikipedia, the screenshot should show the correct login.

    Open Browser    https://pl.wikipedia.org/wiki/Wikipedia:Strona_g%C5%82%C3%B3wna    headlesschrome    executable_path=${project_path}/chromedriver.exe

    Maximize Browser Window

    WikipediaLoginScope    ${login_to_wikipedia}    ${password_to_wikipedia}

    Input Text    class:cdx-text-input__input    "Linux"
    Click Button    xpath=//button[@class="cdx-button cdx-button--action-default cdx-button--weight-normal cdx-button--size-medium cdx-button--framed cdx-search-input__end-button"]

    Capture Page Screenshot    ${project_path}/RobotFramework/screen.png
