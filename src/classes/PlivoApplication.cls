public class PlivoApplication {
  public Integer server_code ;

    public String fallback_method ;

    public Boolean default_app ;

    public String app_name ;

    public Boolean production_app ;
    
    public Boolean default_endpoint_app;

    public String app_id ;
    
    public String sip_uri;
    
    public Boolean enabled ;
    
    public Boolean public_uri;
    
    public String sub_account ;

    public String hangup_url ;

    public String answer_url ;

    public String message_url ;

    public String resource_uri ;

    public String answer_method ;

    public String hangup_method ;

    public String message_method ;

    public String fallback_answer_url ;

    public String error ;

    public String api_id ;

    public String message;

    public PlivoApplication() {
        // empty
    }

  public override String toString() {
    return 'PlivoApplication [serverCode=' + server_code + ', subaccount=' + sub_account
            + ', fallbackMethod='+ fallback_method + ', isDefaultApplication='
        + default_app + ', applicationName=' + app_name + ', enabled=' + enabled
        + ', isProductionApplication=' + production_app + ', isDefaultEndpointApplication= ' + default_endpoint_app 
        + ', publicuri=' + public_uri + ', applicationID=' + app_id + ', sipuri= ' + sip_uri + ', hangupUrl='
        + hangup_url + ', answerUrl=' + answer_url + ', messageUrl='
        + message_url + ', resourceUri=' + resource_uri
        + ', answerMethod=' + answer_method + ', hangupMethod='
        + hangup_method + ', messageMethod=' + message_method
        + ', fallbackAnswerUrl=' + fallback_answer_url + ', error='
        + error + ', apiId=' + api_id + ', message=' + message + ']';
  }
}