*** Settings ***
Library    Browser

*** Variables ***
${SLIDER_ID}    //input[@type='range']    # Replace with your slider's ID or other locator
${EXPECTED_VALUE}    560    # Replace with the value you expect
${EXPECTED_TOTAL_REIMBURSEMENT}    110700
${EXPECTED_SLIDER_VAUE}    input[value='560'][type='range']

*** Test Cases ***
Open FitPeo Homepage
    [Documentation]    Open the web browser and navigate to FitPeo Homepage
    New Browser    chromium    headless=False
    New Page    https://www.fitpeo.com
    Take Screenshot
    Close Page
    

Navigate to Revenue Calculator
    [Documentation]    From the homepage, navigate to the Revenue Calculator Page
    New Page    https://www.fitpeo.com/
    Click    //div[contains(text(),'Revenue Calculator')]
    Wait For Elements State    //h4[normalize-space()='Medicare Eligible Patients']
    Take Screenshot
    Close Page

Scroll down to Revenue Calculator Slider
    [Documentation]    Scroll down the page until the revenue calculator slider is visible.
    New Page    https://www.fitpeo.com/
    Click    //div[contains(text(),'Revenue Calculator')]
    Wait For Elements State    //h4[normalize-space()='Medicare Eligible Patients']
    Take Screenshot
    Close Page

Validate updated slider value
    [Documentation]    Validate Slider Value
    New Page    https://www.fitpeo.com/
    Click    //div[contains(text(),'Revenue Calculator')]
    Wait For Elements State    //h4[normalize-space()='Medicare Eligible Patients']
    Take Screenshot
    Click    div > input[type$='number']
    Clear Text    div > input[type$='number'] 
    Fill Text    div > input[type$='number']    560
    Take Screenshot
    ${slider_value}=    Get Element    input[value='560'][type='range']
    Pass Execution If  "${slider_value}" == "${EXPECTED_SLIDER_VAUE}"    "PASSED"
    Close Page
    

Select CPT Codes
    [Documentation]    Scroll down further and select the checkboxes for CPT-99091, CPT-99453, CPT-99454, and CPT-99474
    New Page    https://www.fitpeo.com/
    Click    //div[contains(text(),'Revenue Calculator')]
    Wait For Elements State    //h4[normalize-space()='Medicare Eligible Patients']
    Take Screenshot
    Click    //span[normalize-space()='57']/preceding-sibling::span
    Click    //span[normalize-space()='19.19']/preceding-sibling::span
    Click    //span[normalize-space()='63']/preceding-sibling::span
    Take Screenshot
    Click    //span[normalize-space()='15']/preceding-sibling::span
    Take Screenshot
    Wait For Elements State    text="Total Recurring Reimbursement for all Patients Per Month:"
    Close Page

Validate Total Reimbursement
    [Documentation]    Validate Total Recurring Reimbursement
    New Page    https://www.fitpeo.com/
    Click    //div[contains(text(),'Revenue Calculator')]
    Wait For Elements State    //h4[normalize-space()='Medicare Eligible Patients']
    Take Screenshot
    Click    div > input[type$='number']
    Clear Text    div > input[type$='number'] 
    Fill Text    div > input[type$='number']    820
    Click    //span[normalize-space()='57']/preceding-sibling::span
    Click    //span[normalize-space()='19.19']/preceding-sibling::span
    Click    //span[normalize-space()='63']/preceding-sibling::span
    Click    //span[normalize-space()='15']/preceding-sibling::span
    Wait For Elements State    text="Total Recurring Reimbursement for all Patients Per Month:"
    ${calculate_value}=    Get Text   p>>"Total Recurring Reimbursement for all Patients Per Month:">>p
    Take Screenshot
    Pass Execution If    '${calculate_value}' == '${EXPECTED_TOTAL_REIMBURSEMENT}'    "Passed"
    Close Page

Verify the header displayed
    [Documentation]    Verify that the header displaying Total Recurring Reimbursement for all Patients Per Month: shows the value $110700.
    New Page    https://www.fitpeo.com/
    Click    //div[contains(text(),'Revenue Calculator')]
    Wait For Elements State    //h4[normalize-space()='Medicare Eligible Patients']
    Take Screenshot
    Click    div > input[type$='number']
    Clear Text    div > input[type$='number'] 
    Fill Text    div > input[type$='number']    820
    Click    //span[normalize-space()='57']/preceding-sibling::span
    Click    //span[normalize-space()='19.19']/preceding-sibling::span
    Click    //span[normalize-space()='63']/preceding-sibling::span
    Click    //span[normalize-space()='15']/preceding-sibling::span
    Wait For Elements State    p>>"Total Recurring Reimbursement for all Patients Per Month:">>p>>"$110700"
    Take Screenshot
    Close Page