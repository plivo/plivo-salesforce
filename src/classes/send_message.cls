public class send_message {
    public send_message(ApexPages.StandardSetController controller) {}

    String auth_Id = 'MAZJDIMJI1NTHIZTBKZT';
    String auth_Token = 'OWJhN2U0NDQ1MDI4ZGNhODk3YTUyYzI3YzFkM2Q4';
    String source = '13306807412';

    public String sms_recipient {
        get;
        set {
            String regex = '[^\\d]';
            String openparen = '(';
            if (value.isNumeric()) sms_recipient = value;
            else if (value.startsWith(openparen)) sms_recipient = '1' + value.replaceAll(regex, '');
            else sms_recipient = value.replaceAll(regex, '');
            System.debug (sms_recipient);
        }
    }
    
    public String textmessage { get; set; }

    public Boolean displaySmsPopup { get; set; }
    public void showSmsPopup() { displaySmsPopup = true; }
    public void closeSmsPopup() { displaySmsPopup = false; }

    public void sendMsg() {
        displaySmsPopup = false;
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
}