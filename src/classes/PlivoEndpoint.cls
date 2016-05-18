public class PlivoEndpoint {
    public Integer server_code ;

    public String username ;

    public String sip_uri ;

    public String alias ;
    
    public String application;

    public String endpoint_id ;

    public String password ;

    public String resource_uri ;

    public String api_id ;
    
    public String sip_registered;
    
    public String sub_account;

    public String error ;

    public String message;

    public PlivoEndpoint() {
        // empty
    }

  public override String toString() {
    return 'PlivoEndpoint [serverCode=' + server_code + ', username=' + username
        + ', sipUri=' + sip_uri + ', alias=' + alias + ', application=' + application + ', endpointId='
        + endpoint_id + ', password=' + password + ', isRegistered=' + sip_registered + ', resourceUri='
        + resource_uri + ', apiId=' + api_id + ', error=' + error + ', subaccount=' + sub_account +
        + ', message=' + message + ']';
  }
}