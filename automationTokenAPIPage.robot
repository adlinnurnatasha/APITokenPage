*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Variables ***
${login_btn}    dt_login_button
${email_field}  name=email
${password_field}   //*[@type="password"]
${login_oauth_btn}   //*[text()="Log in"]

*** Keywords ***


*** Test Cases ***
Open Deriv
    Login   ${my_email}     ${my_pw}
    PersonalDetails
    APIToken
    TestCase1
    TestCase2
    TestCase3
    TestCase4
    TestCase5
    TestCase6
    TestCase7
    TestCase8
