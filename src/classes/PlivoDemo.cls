public with sharing class PlivoDemo {
    public PlivoDemo(){ 
        user = [select plivo_api_key__c, plivo_api_token__c, plivo_number__c, plivo_templates__c, plivo_template_label__c, plivo_answer_url__c, plivo_answer_url_label__c from User where id = :UserInfo.getUserId()]; 
        agents = [select name, phone from Contact where account.name = 'Agents'];
    }
    private User user;
    private List<Contact> agents = new List<Contact>();
    public User getUser() { return user; }
    public class LeadWrapper {
        public Lead lead{ get; set; }
        public Boolean selected { get; set; }
        public LeadWrapper(Lead l) { lead = l; selected = false; }
    }
    List<LeadWrapper> leadsList = new List<LeadWrapper>();
    public List<LeadWrapper> getLeads() {
        if (leadsList.size()==0)
            for(Lead l : [select Name, Company, Phone from Lead])
                leadsList.add(new LeadWrapper(l));
        return leadsList;
    }
    
    public void getSelectedNumbers() {
        sms_recipients = call_recipients = sms_recipients_names = call_recipients_names = '';
        for(LeadWrapper w : leadsList)
            if(w.selected == true) {
                sms_recipients  = (String.isEmpty(sms_recipients))  ? formatNumber(w.lead.phone) : sms_recipients  + '<' + formatNumber(w.lead.phone);
                call_recipients = (String.isEmpty(call_recipients)) ? formatNumber(w.lead.phone) : call_recipients + '<' + formatNumber(w.lead.phone);
                sms_recipients_names  = (String.isEmpty(sms_recipients_names))  ? (w.lead.name) : sms_recipients_names +  ', ' + (w.lead.name);
                call_recipients_names = (String.isEmpty(call_recipients_names)) ? (w.lead.name) : call_recipients_names + ', ' + (w.lead.name);
            }
    }

    private String formatNumber(String input) {
        return (input.isNumeric() ? input : ((input.startsWith('(')) ? '1' + input.replaceAll('[^\\d]', '') : input.replaceAll('[^\\d]', '')));
    }
    
    public String messageoutput { get; set; }
    public void setmessageoutput(String str) { messageoutput = str; }
    public void displayServerResponse(Integer ServerResponse, String SuccessMessage, String ErrorMessage, Boolean isBulk) {
        if (isBulk) {
            if (ErrorMessage == NULL){
                setmessageoutput('Success!');
            } else{
                setmessageoutput(ErrorMessage);
            }
        } else{
            if (ServerResponse == 201 || ServerResponse == 202){
                setmessageoutput('Success!');
            } else{
                setmessageoutput('Error : ' + ErrorMessage);
            }
        }
        System.debug('Status: ' + messageoutput);
    }
    
    public void closepopup() { closeSmsPopup(); closePhonePopup(); closeBulkSmsPopup(); closeBulkPhonePopup(); closeSettingsPopup();}

    //
    // Single Message methods
    //
    public Boolean displaySmsPopup { get; set; }
    public void showSmsPopup() { displaySmsPopup = true; }
    public void closeSmsPopup() { displaySmsPopup = false; sms_recipient = sms_recipient_name = textmessage = messageoutput = ''; }
    
    public String sms_recipient { get; set { sms_recipient = formatNumber(value); }}
    public String sms_recipient_name { get; set; }
    public String textmessage { get; set; }
    public String new_sms_template_label { get; set; }
    public String new_sms_template { get; set; }
    
    public void sendMsg() {
        RestAPI api = new RestAPI(user.plivo_api_key__c, user.plivo_api_token__c, 'v1');
        Map<String, String> params = new Map<String, String> ();
        params.put('src',user.plivo_number__c);
        params.put('dst',sms_recipient);
        params.put('text',textmessage);
        MessageResponse SendMsgResponse = api.sendMessage(params);
        System.debug('Response: ' + SendMsgResponse);
        displayServerResponse(SendMsgResponse.server_code, SendMsgResponse.message, SendMsgResponse.error, false);
    }

    //
    // Bulk Messages methods
    //
    public Boolean displayBulkSmsPopup { get; set; }
    public void showBulkSmsPopup() { displayBulkSmsPopup = true; }
    public void closeBulkSmsPopup() { displayBulkSmsPopup = false; sms_recipients = sms_recipients_names = textmessage = messageoutput = ''; }

    public String sms_recipients { get; set; }
    public String sms_recipients_names { get; set; }
    
    public List<SelectOption> getSmsTemplates(){
        // Syntax for entering a value into selectList Apex element is new SelectOption(String value,String label)
        // Get all Templates and Labels
        String templates_fromdb = user.plivo_templates__c;
        String templates_labels_fromdb = user.plivo_template_label__c;
        
        // Input String plivo_templates__c and plivo_template_label__c in to 2 Lists. 
        // Split based on new line
        List<String> template_options = templates_fromdb.split('\n');
        List<String> template_labels = templates_labels_fromdb.split('\n');
        
        // Debug Lines
        System.debug(templates_fromdb);
        System.debug(templates_labels_fromdb);
        
        // Get lengths os lists
        Integer templates_length = template_options.size();
        Integer labels_length = template_labels.size();
        
        List<SelectOption> smsoptions = new List<Selectoption>();
        smsoptions.add(new SelectOption('','--Blank--'));
        if (templates_length == labels_length){
            for (Integer i = 0; i<templates_length;i++){
                System.debug('Label : ' + template_labels[i]);
                System.debug('Template : ' + template_options[i]);
                smsoptions.add(new SelectOption(template_options[i],template_labels[i]));
                System.Debug('Successfully added to SelectOption');
            }
        } else {
            setmessageoutput('Count mismatch in Label and Template. Please make sure that every template has a corresponding label');
        }
        return smsoptions;
    }

    public void sendMsgs() {
        RestAPI api = new RestAPI(user.plivo_api_key__c, user.plivo_api_token__c, 'v1');
        Map<String, String> params = new Map<String, String> ();
        params.put('src',user.plivo_number__c);
        params.put('dst',sms_recipients);
        params.put('text',textmessage);
        System.debug ('Params: ' + params);
        System.debug ('Sending bulk messages now');
        MessageResponse SendMsgsResponse = api.sendMessage(params);
        System.debug('Response: ' + SendMsgsResponse);
        String resp_message = '';
        if (SendMsgsResponse.server_code != 202){
            resp_message = 'No messages were sent. Error: ' + SendMsgsResponse.error;
            displayServerResponse(SendMsgsResponse.server_code, resp_message, resp_message, true);
        } else{
            displayServerResponse(SendMsgsResponse.server_code, SendMsgsResponse.message, SendMsgsResponse.error, true);
        }
        
    }
    
    //
    // Single Call methods
    //
    public Boolean displayPhonePopup { get; set; }
    public void showPhonePopup() { displayPhonePopup = true; }
    public void closePhonePopup() { displayPhonePopup = false; call_source = call_recipient = call_recipient_name = messageoutput = ''; }

    public String call_source { get; set { call_source = formatNumber(value); }}
    public String call_recipient { get; set {call_recipient = formatNumber(value); }}
    public String call_recipient_name { get; set; }
    
    public List<SelectOption> call_sources_options = new List<SelectOption>();
    public List<SelectOption> getcall_sources() {
        if (call_sources_options.isEmpty()) {
            for (Contact agent : agents){
                System.debug('Contact Name: ' + agent.name);    
                System.debug('Contact Phone: ' + agent.phone);
                if (agent.phone != NULL) { call_sources_options.add(new SelectOption(agent.phone,agent.name)); }
            }
            return call_sources_options;
        } else { return call_sources_options; }   
    }
    
    public void placeCall() {
        RestAPI api = new RestAPI(user.plivo_api_key__c, user.plivo_api_token__c, 'v1');
        String answer_url = 'https://morning-ocean-4669.herokuapp.com/salesforce_answer/' + call_recipient + '/' ;
        Map<String, String> params = new Map<String, String> ();
        params.put('from', user.plivo_number__c);
        params.put('to', call_source);
        params.put('answer_url', answer_url);
        params.put('answer_method','GET');
        System.debug ('Params: ' + params);
        System.debug ('Making call now');
        Call PlaceCallResponse = api.makeCall(params);
        System.debug('Response: ' + PlaceCallResponse);
        displayServerResponse(PlaceCallResponse.server_code, PlaceCallResponse.message, PlaceCallResponse.error, false);
    }
    
    //
    // Bulk Calls methods
    //
    public Boolean displayBulkPhonePopup { get; set; }
    public void showBulkPhonePopup() { displayBulkPhonePopup = true; }
    public void closeBulkPhonePopup() { displayBulkPhonePopup = false; call_recipients = call_recipients_names = answer_url = messageoutput = ''; }
    
    public String call_recipients { get; set; }
    public String call_recipients_names { get; set; }
    public String answer_url{ get; set; }
    
    public List<SelectOption> call_templates_list = new List<SelectOption>();
    public List<SelectOption> getcall_templates(){
        if (call_templates_list.isEmpty()) {
            // Syntax for entering a value into selectList Apex element is new SelectOption(String value,String label)
            // Get all Answer URLs and Labels
            String answer_url_fromdb = user.plivo_answer_url__c;
            String answer_url_labels_fromdb = user.plivo_answer_url_label__c;
        
            // Input String plivo_answer_url__c and plivo_answer_url_label__c in to 2 Lists. 
            // Split based on new line
            List<String> answer_url_options = answer_url_fromdb.split('\n');
            List<String> answer_url_labels = answer_url_labels_fromdb.split('\n');
        
            // Debug Lines
            System.debug('Answer URL: ' + answer_url_fromdb);
            System.debug('Answer URL Label: ' + answer_url_labels_fromdb);
        
            // Get lengths os lists
            Integer answer_url_length = answer_url_options.size();
            Integer answer_url_label_length = answer_url_labels.size();
        
            call_templates_list.add(new SelectOption('','--None--'));
            if (answer_url_length == answer_url_label_length){
                for (Integer i = 0; i<answer_url_length;i++){
                    call_templates_list.add(new SelectOption(answer_url_options[i],answer_url_labels[i]));
                }
            }
            return call_templates_list;
        } else { return call_templates_list; }
    }

    public void placeCalls() {
        RestAPI api = new RestAPI(user.plivo_api_key__c, user.plivo_api_token__c, 'v1');
        System.debug('Recipients: ' + call_recipients);
        System.debug('Answer URL: ' + answer_url);
        Map<String, String> params = new Map<String, String> ();
        params.put('from', user.plivo_number__c);
        params.put('to', call_recipients);
        params.put('answer_url', answer_url);
        params.put('answer_method','GET');
        System.debug ('Params: ' + params);
        System.debug ('Making call now');
        String resp_message = '';
        if (call_recipients.contains('<')) {
            BulkCall PlaceCallsResponse = api.makeBulkCall(params);
            System.debug('Response: ' + PlaceCallsResponse);
            System.debug('Request UUIDs: ' + PlaceCallsResponse.request_uuid);
            Integer length = PlaceCallsResponse.request_uuid.size();
            for (integer i = 0; i<length; i++){
                if (PlaceCallsResponse.request_uuid[i] == NULL){
                    Integer j = i + 1;
                    resp_message = 'Error: The number at position ' + j + ' is invalid. Call was not made to this number';
                } else{
                    resp_message = 'Success!';
                }
            }
            displayServerResponse(PlaceCallsResponse.server_code, PlaceCallsResponse.message, resp_message, true);
        } else {
            Call PlaceCallsResponse = api.makeCall(params);
            System.debug('Response: ' + PlaceCallsResponse);
            displayServerResponse(PlaceCallsResponse.server_code, PlaceCallsResponse.message, PlaceCallsResponse.error, false);
        }
    }
    
    //
    // Settings popup
    //
    public Boolean displaySettingsPopup { get; set; }
    public void showSettingsPopup() { displaySettingsPopup = true; }
    public void closeSettingsPopup() { displaySettingsPopup = false; messageoutput = ''; }
    
    public void SaveSettings() { update user; closepopup(); }
}