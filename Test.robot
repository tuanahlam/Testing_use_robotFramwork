**Settings**
Library      SeleniumLibrary

Resource     resource.robot 


***Test Cases*** 
#test ได้ทีล่ะ test case 
# Click Image      //*[@id="646aa42792f3ca00123112e5-add-amount"] ถ้า error ให้เปลี่ยน image --> element แทนนะคะ
# don't forget check ${Path}
Test case1
    Open Browser TO Login Page
    PageSelectTeam Should be open
    Select Team
    Loop For select other sales channels
    Payment Method    
    Sleep    5s
    [Teardown]    Close Browser

Test Cases2
    Open Browser TO Login Page
    PageSelectTeam Should be open
    Select Team
    Loop For fill in address
    Payment Method    
    Sleep    5s
    [Teardown]    Close Browser

Test Cases3
    Open Browser TO Login Page
    PageSelectTeam Should be open
    Select Team
    Loop For fill product fill by yourself
    Payment Method    
    Sleep    5s
    [Teardown]    Close Browser

Test Cases4
    Open Browser TO Login Page
    PageSelectTeam Should be open
    Select Team
    Loop For cash on delivery
    Payment Method    
    Sleep    5s
    [Teardown]    Close Browser



























