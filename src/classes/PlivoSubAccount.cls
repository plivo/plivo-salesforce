public class PlivoSubAccount {
    public Integer server_code;
    
    public String account ;

    public String error ;

    public String api_id ;

    public String auth_id ;

    public String auth_token ;

    public String new_auth_token ;

    public String resource_uri ;

    public String created ;

    public Boolean enabled ;

    public String modified ;

    public String name ;

    public String message;

    public PlivoSubAccount() {
        // empty
    }

    public override String toString() {
        return 'ServerCode=' + server_code + ' PlivoSubAccount [account=' + account + ', error=' + error
        + ', apiId=' + api_id + ', authId=' + auth_id + ', authToken='
        + auth_token + ', newAuthToken=' + new_auth_token
        + ', resourceUri=' + resource_uri + ', createdOn=' + created
        + ', isEnabled=' + enabled + ', lastModifiedOn='
        + modified + ', name=' + name + ', message=' + message
        + ']';
    }
}