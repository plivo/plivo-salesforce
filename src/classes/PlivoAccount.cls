public class PlivoAccount {
    public Integer server_code ;
    
    public String account_type;
    
    public String city ;
    
    public String name ;
    
    public String cash_credits ;
    
    public String created ;
    
    public String enabled ;
    
    public String modified ;
    
    public String error ;
    
    public String api_id ;
    
    public String billing_mode ;
    
    public String state ;
    
    public String address ;
    
    public String timezone ;
    
    public String auth_id ;
    
    public String resource_uri ;
    
    public Boolean auto_recharge;
    
    public PlivoAccount() {
        // empty
    }
    
    public override String toString() {
        return 'ServerCode =' + server_code + ' Account [accountType =' + account_type + ', city=' + city + ', name=' + name + ', cashCredits='
                + cash_credits + ', created=' + created + ', enabled=' + enabled
                + ', modified=' + modified + ', error=' + error + ', apiId='
                + api_id + ', billingMode=' + billing_mode + ', auto_recharge=' + auto_recharge + ', state=' + state
                + ', address=' + address + ', timezone=' + timezone
                + ', authID=' + auth_id + ', resourceURI=' + resource_uri + ']';
    }
}