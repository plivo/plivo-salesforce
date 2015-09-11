public class send_bulk_message {

    // Ramya's Auth ID and Token
    //String sms_source = '18583650866';
    //String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
    //String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
    // Charlie's Number, Auth ID and Token
    String sms_source = '13306807412';
    String auth_Id = 'MAZJDIMJI1NTHIZTBKZT';
    String auth_Token = 'OWJhN2U0NDQ1MDI4ZGNhODk3YTUyYzI3YzFkM2Q4';
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

    public String sms_recipients {get;set;}

    public PageReference getSelected() {
        sms_recipients = '';
        for(leadbulkwrapper bulkwrapper : leadsList) {
            if(bulkwrapper.selected == true) {
                if (String.isEmpty(sms_recipients)) sms_recipients = formatNumber(bulkwrapper.lead.phone);
                else sms_recipients = sms_recipients + '<' + formatNumber(bulkwrapper.lead.phone);
            }
        }
        System.debug(sms_recipients);
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

    public String textmessage {get;set;}
    public Boolean displaySmsPopup {get;set;}
    public void showSmsPopup() { displaySmsPopup = true; }
    public void closeSmsPopup() { displaySmsPopup = false; }

    public void sendMsg() {
        displaySmsPopup = false;
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        Map<String, String> params = new Map<String, String> ();
        params.put('src',sms_source);
        params.put('dst',sms_recipients);
        params.put('text',textmessage);
        System.debug (params);
        System.debug ('Sending message now');
        MessageResponse msg = api.sendMessage(params);
        String api_id = msg.api_id;
        System.debug (msg);
    }
}