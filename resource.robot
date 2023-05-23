*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}         chrome
${URL}             https://www.myorder.ai/auth/login
${DELEY}           1
${ListTeamPage}    https://www.myorder.ai/team/list 
${OtherSell}       https://www.myorder.ai/order/other-sell
${Path}            D:/Dell/OneDrive/Desktop/practice/TestScript
@{ImageList}=      Create List    slip1.jpg    slip2.jpg   slip3.jpg   slip4.jpg   slip5.jpg   slip6.jpg   slip7.jpg   slip8.jpg   slip9.jpg   slip10.jpg
${ImageFilePath}   ${Path}./slip2.jpg
${index}


***Keywords***
Open Browser TO Login Page 
    open browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   ${DELEY}
    Input Text        //*[@id="email-input"]       test12@gmail.com
    Input Password    //*[@id="password-input"]    Ahlam2023!
    Click Button      //*[@id="login-button"] 

PageSelectTeam Should be open
    Title Should be    MyOrder 

Go To ListTeamPage
    Go To    ${ListTeamPage}
    PageSelectTeam Should be open

PageOtherSell Should be open
    Title Should be    MyOrder 

Select Team
    Click Element    //*[@id="646aa380497806001821bf2e"] 
    #class=team-box
    Go To            ${OtherSell}
    PageOtherSell Should be open

Click Chanel sell
    Click Element    //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[3]/div/div/div[1]
    Input Text       //*[@id="address-detect-input"]     ต่วนอะห์ลัม 98 ม.1 ต.ตะบิ้ง อ.สายบุรี จ.ปัตตานี 94110 0927442165
    Click Element    //*[@id="system-product-add"]
    Click Element     //*[@id="646998ae5aac3400124d524b-add-amount"]
    Click Button     //*[@id="select-product-button"]
    Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[1]/div/input    30
    Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[2]/div/input    30

Payment Method
    Click Element    //*[@id="payment-type-input"]/app-dropdown/div
    Click Element    //*[@id="bank"]
    Choose File      xpath://div[@class='has-sample focused ng-star-inserted']/label/input[@type='file']    ${ImageFilePath}
    Click Element    //*[@id="cancel-order-button"]/div[2]

cash on delivery
    Click Element    //*[@id="payment-type-input"]/app-dropdown/div
    Click Element    //*[@id="cod"]
    Click Element    //*[@id="cancel-order-button"]/div[2]



Loop For select other sales channels
    FOR    ${index}    IN RANGE    1    10
        Click Element    xpath://*[@id="content-main-page"]/app-other-sell/div/div[1]/div[3]/div/div/div[${index}]
        Input Text       //*[@id="address-detect-input"]     คุณมายด์ออเดอร์ ผู้น่ารัก 0831725655 69/429 หมู่ 2 ต.วิชิต อ.เมือง จ.ภูเก็ต 83000
        Click Element    //*[@id="system-product-add"]
        Click Element      //*[@id="646aa42792f3ca00123112e5-add-amount"]
        Click Button     //*[@id="select-product-button"]
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[1]/div/input    30
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[2]/div/input    30
        Payment Method
    END

Loop For Slip
    @{ImageList}=      Create List    slip1.jpg    slip2.jpg   slip3.jpg   slip4.jpg   slip5.jpg   slip6.jpg   slip7.jpg   slip8.jpg   slip9.jpg   slip10.jpg
    FOR    ${image}    IN    @{ImageList}
        Wait Until Element Is Visible    xpath://div[@class='has-sample focused ng-star-inserted']
        Choose File    ${element_xpath}    D:/Dell/OneDrive/Desktop/practice/TestScript/${image}
        Click Element    //*[@id="cancel-order-button"]/div[2]
    END

Loop For fill in address
        FOR    ${index}    IN RANGE    1    10
        Click Element    xpath://*[@id="content-main-page"]/app-other-sell/div/div[1]/div[3]/div/div/div[${index}]
        Input Text       //*[@id="customer-name-input"]     คุณมายด์ออเดอร์ ผู้น่ารัก
        Input Text       //*[@id="tel-input"]               0831725655
        Input Text       //*[@id="address-input"]           69/429 หมู่ 2
        Input Text       //*[@id="search-address"]          ต.วิชิต อ.เมือง จ.ภูเก็ต 83000      
        Click Element    //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[2]/app-other-sell-form-receiver-info/form/div/div[9]/div/span/div/div/div          
        Input Text       //*[@id="email-input"]             test@gmail.com
        Input Text       //*[@id="comment-input"]           -
        Click Element    //*[@id="system-product-add"]      
        Click Image      //*[@id="646aa42792f3ca00123112e5-add-amount"]
        Click Button     //*[@id="select-product-button"]
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[1]/div/input    30
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[2]/div/input    30
        Payment Method
    END

Loop For fill product fill by yourself
    FOR    ${index}    IN RANGE    1    10
        Click Element    xpath://*[@id="content-main-page"]/app-other-sell/div/div[1]/div[3]/div/div/div[${index}]
        Input Text       //*[@id="address-detect-input"]     คุณมายด์ออเดอร์ ผู้น่ารัก 0831725655 69/429 หมู่ 2 ต.วิชิต อ.เมือง จ.ภูเก็ต 83000
        Click Element    //*[@id="custom-product-add"]
        Input Text       //*[@id="custom-product-name-input-0"]     เสื้อ V 
        Input Text       //*[@id="custom-product-price-input-0"]    2000
        Input Text       //*[@id="custom-product-weight-input-0"]     2
        Click Image      //*[@id="increase-amount-0"]
        Click Button     //*[@id="select-product-button"]
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[1]/div/input    30
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[2]/div/input    30
        Payment Method
    END

Loop For cash on delivery
    FOR    ${index}    IN RANGE    1    10
        Click Element    xpath://*[@id="content-main-page"]/app-other-sell/div/div[1]/div[3]/div/div/div[${index}]
        Input Text       //*[@id="address-detect-input"]     คุณมายด์ออเดอร์ ผู้น่ารัก 0831725655 69/429 หมู่ 2 ต.วิชิต อ.เมือง จ.ภูเก็ต 83000
        Click Element    //*[@id="system-product-add"]
        Click Image      //*[@id="646aa42792f3ca00123112e5-add-amount"]
        Click Button     //*[@id="select-product-button"]
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[1]/div/input    30
        Input Text       //*[@id="content-main-page"]/app-other-sell/div/div[1]/div[5]/div[3]/app-other-sell-manage-basket/div/div[2]/div/div[2]/div[2]/div/input    30
        cash on delivery
    END



