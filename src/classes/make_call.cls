public class make_call {
    public make_call(ApexPages.StandardSetController controller) {}

    // Ramya's number, Auth ID and Auth Token
    //String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
    //String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
    // Charlie's number, Auth ID and Auth Token
    String auth_Id = 'MAZJDIMJI1NTHIZTBKZT';
    String auth_Token = 'OWJhN2U0NDQ1MDI4ZGNhODk3YTUyYzI3YzFkM2Q4';
    String caller_id = '13306807412';

    // List of people/numbers to connect call to.  1st field is number to call, 2nd field is what gets displayed
    public List<SelectOption> getcall_sources(){
        List<SelectOption> options = new List<Selectoption>();
        options.add(new SelectOption('14159938809','Charlie - work'));
        options.add(new SelectOption('13039025082','Charlie - mobile'));
        options.add(new SelectOption('919686861104','Sneha'));
        options.add(new SelectOption('919663489033','Ramya'));
        return options;
    }

    // Boolean to show or hide phone popup box
    public Boolean displayPhonePopup {get;set;}
    public void showPhonePopup() { displayPhonePopup = true; }
    public void closePhonePopup() { displayPhonePopup = false; }

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

    // format number by taking out non numeric characters and adding a 1 for US numbers (Salesforce stores US numbers as (xxx) xxx-xxxx)
    private String formatNumber(String input) {
        String regex = '[^\\d]';
        String openparen = '(';
        String result;
        if (input.isNumeric()) result = input;
        else if (input.startsWith(openparen)) result = '1' + input.replaceAll(regex, '');
        else result = input.replaceAll(regex, '');
        return result;
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
}