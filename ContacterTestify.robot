*** Settings ***
Library    Browser    #voir l'installation

*** Variables ***
${URL}    https://form.jotform.com/241263471608354

*** Test Cases ***
Scenario: TC_001 - Tester les champs requis
    Open Browser    ${URL}    headless=false 
    Fill Text    xpath=//input[@id='input_7']    captcha
    Click    xpath=//button[@id='input_16']
    ${page_source}=    Get Page Source
    Should Contain    ${page_source}    There are errors on the form. Please fix them before continuing.
    #Given un visiteur sur le formulaire de contact
    #When je fais le captcha
    #And je clique sur le bouton submit
    #Then je dois avoir le message d erreur suivant "There are errors on the form. Please fix them before continuing."!
    Close Browser
