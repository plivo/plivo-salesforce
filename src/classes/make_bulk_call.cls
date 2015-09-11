public class make_bulk_call {
    
    public make_bulk_call(ShowContactsBulk controller) {}
    // Ramya's Auth ID and Token
    //String source = '18583650866';
    //String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
    //String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
    // Charlie's Number, Auth ID and Token
    String source = '13306807412';
    String auth_Id = 'MAZJDIMJI1NTHIZTBKZT';
    String auth_Token = 'OWJhN2U0NDQ1MDI4ZGNhODk3YTUyYzI3YzFkM2Q4';
    
    public String call_recipients {get;set;}
    
    public List<SelectOption> getTemplates(){
        List<SelectOption> options = new List<Selectoption>();
        options.add(new SelectOption('https://gist.githubusercontent.com/cachrisman/6bfca400262ac98a9a4e/raw/0c1a7d690d3c05e69e7731effb3e7a2d5b55dd57/congratulations.xml','Congratulations'));
        options.add(new SelectOption('https://gist.githubusercontent.com/cachrisman/e50e61362f6e77689a9f/raw/d866b2356d2c5f3870e991d063185bddd457397d/trumpet.xml','Trumpet'));
        return options;
    }

    public class leadbulkwrapper {
        public Lead lead{ get; set; }
        public Boolean selected { get; set; }
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

    public PageReference getSelectedPhoneNumbers() {
        call_recipients = '';
        for(leadbulkwrapper bulkwrapper : leadsList) {
            if(bulkwrapper.selected == true) {
                if (String.isEmpty(call_recipients)) call_recipients = formatNumber(bulkwrapper.lead.phone);
                else call_recipients = call_recipients + '<' + formatNumber(bulkwrapper.lead.phone);
            }
        }
        System.debug('Call Recipients: '+call_recipients);
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
  
    public String answer_url{get;set;}

    public Boolean displayPhonePopup {get;set;}
    public void showPhonePopup() { displayPhonePopup = true; }
    public void closePhonePopup() { displayPhonePopup = false;}

    public void placeCall() {
        displayPhonePopup = false;
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
}