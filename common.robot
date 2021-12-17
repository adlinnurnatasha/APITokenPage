*** Settings ***
Documentation    Suite description


*** Keywords ***
Login
    [arguments]     ${email}    ${pw}
     Open Browser   url=https://app.deriv.com   browser=chrome
     maximize browser window
     wait until page does not contain element    dt_core_header_acc-info-preloader   60
	 wait until page contains element   ${login_btn}     60
	 Click Element   ${login_btn}
     wait until page contains element   ${email_field}      15
	 input text     ${email_field}      ${email}
	 input text     ${password_field}      ${pw}
	 Click Element   ${login_oauth_btn}

PersonalDetails
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element                               //*[@id="dt_core_header_acc-info-container"]
    click element                               //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div

APIToken
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element            //*[@id="/account/api-token"]       60
    click element                               //*[@id="/account/api-token"]

TestCase1
#Check whether all the scopes are clickable.
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    #Click Unclick "Read"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    double click element                //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    #Click Unclick "Trade"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    double click element                //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    #Click Unclick "Payments"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    double click element                //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    #Click Unclick "Admin"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    double click element                //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    #Click Unclick "Trading Information"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]
    double click element                //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]

TestCase2
#Verify whether all the scopes can be clicked all together.
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    #Click "Read"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    #Click  "Trade"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    #Click Payments
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    #Click Admin
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    #Click "Trading Information"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]

TestCase3
#Length of token name must be between 2 and 32 characters. (Positive expected results)
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element            //*[@class="dc-input__field"]
    #Input 2 characters
    input text                                  //*[@class="dc-input__field"]   as
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2
    #Input 32 characters
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    input text                                  //*[@class="dc-input__field"]   asdfghjklqwertyuiopzxcvbnmasdfgh
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2

TestCase4
#Length of token name must be between 2 and 32 characters. (Negative expected results)
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element            //*[@class="dc-input__field"]
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    #Input 1 character
    input text                                  //*[@class="dc-input__field"]   a
    page should contain element                 //*[@type="submit" and @disabled]
    sleep   2
    #Input 33 characters
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    input text                                  //*[@class="dc-input__field"]   asdfghjklqwertyuiopzxcvbnmasdfghi
    page should contain element                 //*[@type="submit" and @disabled]
    sleep   2

TestCase5
#Only letters, numbers and underscores are allowed for input token names.
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element            //*[@class="dc-input__field"]
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    #Input alphanumeric
    input text                                  //*[@class="dc-input__field"]   abc123
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2
    #Input numeric
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    input text                                  //*[@class="dc-input__field"]   123
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2
    #Input alphabets with underscore
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    input text                                  //*[@class="dc-input__field"]   a_b_c
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2
    #Input number with underscore
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    input text                                  //*[@class="dc-input__field"]   1_2_3
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2
    #Input alphanumeric with underscore
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    input text                                  //*[@class="dc-input__field"]   abc_123
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2

TestCase6
#Check whether the “Create” button can be clicked when the token name is input.
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element            //*[@class="dc-input__field"]
    press keys                                  //*[@class="dc-input__field"]   CTRL+ALL    DELETE
    #Input 2 characters
    input text                                  //*[@class="dc-input__field"]   Balance Sheet
    page should not contain element             //*[@type="submit" and @disabled]
    sleep   2

TestCase7
#Verify whether the “Create” button cannot be clicked when none of the scope is clicked.
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element            //*[@class="dc-input__field"]
    #Unclick all scopes
    #Unclick "Read"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    #Unclick  "Trade"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]
    #Unclick Payments
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]
    #Unclick Admin
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]
    #Unclick "Trading Information"
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]
    #Verify "Create" button cannot click
    page should contain element          //*[@type="submit" and @disabled]

TestCase8
#“Name” must be the same as input.
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element            //*[@class="dc-input__field"]
    #Click scope (Read)
    wait until page contains element     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    click element                        //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
    #Click "Create"
    click element                        //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
    #Verify the name
    page should contain                  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/thead/tr/th[1]/span




