public with sharing class ShowContactsBulk {
    // Ramya's Auth ID and Token
    String source = '18583650866';
    String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
    String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
    // Charlie's Number, Auth ID and Token
    // String source = '13306807412';
    // String auth_Id = 'MAZJDIMJI1NTHIZTBKZT';
    // String auth_Token = 'OWJhN2U0NDQ1MDI4ZGNhODk3YTUyYzI3YzFkM2Q4';
    
    public class leadbulkwrapper {
        public Lead lead{get; set;}
        public Boolean selected {get; set;}
        public leadbulkwrapper(Lead l) {
            lead = l;
            selected = false;
        }
    }
    List<leadbulkwrapper> leadsList = new List<leadbulkwrapper>();
    public List<leadbulkwrapper> getLeads() {
        if (leadsList.size()==0)
            for(Lead l : [select Name, Company, Phone from Lead])
                leadsList.add(new leadbulkwrapper(l));
        return leadsList;
    }
    
    public PageReference getSelectedNumbers() {
        sms_recipients = '';
        call_recipients = '';
        // call_recipients_list.clear();
        for(leadbulkwrapper bulkwrapper : leadsList)
            if(bulkwrapper.selected == true) {
                if (String.isEmpty(sms_recipients)) sms_recipients = formatNumber(bulkwrapper.lead.phone);
                else sms_recipients = sms_recipients + '<' + formatNumber(bulkwrapper.lead.phone);
                if (String.isEmpty(call_recipients)) call_recipients = formatNumber(bulkwrapper.lead.phone);
                else call_recipients = call_recipients + '<' + formatNumber(bulkwrapper.lead.phone);
                // call_recipients_list.add(formatNumber(bulkwrapper.lead.phone));
            }
        System.debug('SMS Recipients: ' + sms_recipients);
        // System.debug('Call Recipients: ' + call_recipients_list);
        System.debug('Call Recipients: ' + call_recipients);
        return null;
    }

    private String formatNumber(String input) {
        String regex = '[^\\d]';
        String openparen = '(';
        String result;
        if (input.isNumeric()) result = input;
        else if (input.startsWith(openparen)) result = '1' + input.replaceAll(regex, '');
        else result = input.replaceAll(regex, '');
        return result;
    }
    
    //
    // Single Message methods
    //
    public Boolean displaySmsPopup {get;set;}
    public void showSmsPopup() { displaySmsPopup = true; }
    public void closeSmsPopup() { 
        displaySmsPopup = false; 
        sms_recipient = '';
        textmessage = '';
    }
    
    public String sms_recipient {
        get;
        set {
            sms_recipient = formatNumber(value);
            System.debug ('SMS Recipient: ' + sms_recipient);
        }
    }
    
    public void sendMsg() {
        closeSmsPopup();
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        Map<String, String> params = new Map<String, String> ();
        params.put('src',source);
        params.put('dst',sms_recipient);
        params.put('text',textmessage);
        System.debug (params);
        System.debug ('Sending message now');
        MessageResponse msg = api.sendMessage(params);
        String api_id = msg.api_id;
        System.debug (msg);
    }
    //
    // Single Call methods
    //
    
    // List of people/numbers to connect call to.  1st field is number to call, 2nd field is what gets displayed
    public List<SelectOption> getcall_sources(){
        List<SelectOption> options = new List<Selectoption>();
        options.add(new SelectOption('14159938809','Charlie - work'));
        options.add(new SelectOption('13039025082','Charlie - mobile'));
        options.add(new SelectOption('919686861104','Sneha'));
        options.add(new SelectOption('919663489033','Ramya'));
        return options;
    }
    // class to get or set (and format) call_source
    public String call_source {
        get;
        set {
            call_source = formatNumber(value);
            System.debug ('Call Source: ' + call_source);
        }
    }

    // class to get or set (and format) call_recipient
    public String call_recipient {
        get;
        set {
            call_recipient = formatNumber(value);
            System.debug ('Call Recipient: ' + call_recipient);
        }
    }
    // Boolean to show or hide phone popup box
    public Boolean displayPhonePopup {get;set;}
    public void showPhonePopup() { displayPhonePopup = true; }
    public void closePhonePopup() { 
        displayPhonePopup = false; 
        call_source = '';
        call_recipient = '';
    }
    
    // method to send Plivo API request which initiates call
    public void placeCall() {
        displayPhonePopup = false;
        String answer_url = 'https://morning-ocean-4669.herokuapp.com/salesforce_answer/' + call_recipient + '/' ;
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        Map<String, String> params = new Map<String, String> ();
        params.put('from', call_recipient);
        params.put('to', call_source);
        params.put('answer_url', answer_url);
        params.put('answer_method','GET');
        System.debug ('Params: ' + params);
        System.debug ('Making call now');
        Call call_resp = api.makeCall(params);
        System.debug ('API Response: ' + call_resp);
    }
    
    //
    // Bulk Messages methods
    //
    public String sms_recipients {get;set;}
    // public String sms_messages{get;set;}
    
    public String textmessage {get;set;}
    
    public Boolean displayBulkSmsPopup {get;set;}
    public void showBulkSmsPopup() { displayBulkSmsPopup = true; }
    public void closeBulkSmsPopup() { 
        displayBulkSmsPopup = false; 
        sms_recipients = '';
        textmessage = '';
    }
    
    public List<SelectOption> getSmsTemplates(){
        List<SelectOption> smsoptions = new List<Selectoption>();
        smsoptions.add(new SelectOption('',''));
        smsoptions.add(new SelectOption('Hey there! What\'s up?','Greeting'));
        smsoptions.add(new SelectOption('I\'m busy right now. I\'ll call you later','Busy'));
        smsoptions.add(new SelectOption('I\'m in a meeting. What\'s up?','Meeting'));
        return smsoptions;
    }

    public void sendMsgs() {
        closeBulkSmsPopup();
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        Map<String, String> params = new Map<String, String> ();
        params.put('src',source);
        params.put('dst',sms_recipients);
        params.put('text',textmessage);
        System.debug (params);
        System.debug ('Sending bulk messages now');
        MessageResponse msg = api.sendMessage(params);
        String api_id = msg.api_id;
        System.debug (msg);
    }
    
    //
    // Bulk Calls methods
    //
    public String call_recipients {get;set;}
    // public List<String> call_recipients_list = new List<String>();
    // public List<String> getcall_recipients() { return call_recipients_list;}
    public String answer_url{get;set;}
    
    public List<SelectOption> getcall_templates(){
        List<SelectOption> call_options = new List<Selectoption>();
        call_options.add(new SelectOption('http://www.chrisman.biz/congratulations.xml','Congratulations'));
        call_options.add(new SelectOption('http://www.chrisman.biz/trumpet.xml','Trumpet'));
        return call_options;
    }
  
    public Boolean displayBulkPhonePopup {get;set;}
    public void showBulkPhonePopup() { displayBulkPhonePopup = true; }
    public void closeBulkPhonePopup() { 
        call_recipients = '';
        displayBulkPhonePopup = false;
    }

    public void placeCalls() {
        closeBulkPhonePopup();
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        System.debug('Recipient: ' + call_recipients);
        System.debug('Answer URL: ' + answer_url);
        Map<String, String> params = new Map<String, String> ();
        params.put('from', source);
        params.put('to', call_recipients);
        params.put('answer_url', answer_url);
        params.put('answer_method','GET');
        System.debug (params);
        System.debug ('Making call now');
        BulkCall call_resp = api.makeBulkCall(params);
        System.debug ('API Response : ' + call_resp);
        
    }
    
    // public void placeCall() {
    //     displayBulkPhonePopup = false;
    //     RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
    //     for(String call_recipient : call_recipients_list) {
    //         Map<String, String> params = new Map<String, String> ();
    //         params.put('from', source);
    //         params.put('to', call_recipient);
    //         params.put('answer_url', answer_url);
    //         params.put('answer_method','GET');
    //         params.put('hangup_url','');
    //         params.put('fallback_url','');
    //         System.debug ('Making call now with params: ' + params);
    //         Call call_resp = api.makeCall(params);
    //         System.debug ('API Response : ' + call_resp);
    //     }
    // }
}