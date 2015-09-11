public class PlivoAccount {
    public String city ;
    
    public String name ;
    
    public String cash_credits ;
    
    public String created ;
    
    public String enabled ;
    
    public String modified ;
    
    public String error ;
    
    public String api_id ;
    
    public String postpaid ;
    
    public String state ;
    
    public String address ;
    
    public String timezone ;
    
    public String auth_id ;
    
    public String resource_uri ;
    
    public PlivoAccount() {
        // empty
    }
    
    public override String toString() {
        return 'Account [city=' + city + ', name=' + name + ', cashCredits='
                + cash_credits + ', created=' + created + ', enabled=' + enabled
                + ', modified=' + modified + ', error=' + error + ', apiId='
                + api_id + ', postpaid=' + postpaid + ', state=' + state
                + ', address=' + address + ', timezone=' + timezone
                + ', authID=' + auth_id + ', resourceURI=' + resource_uri + ']';
    }
}