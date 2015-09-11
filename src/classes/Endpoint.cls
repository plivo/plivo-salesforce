public class Endpoint {
	public Integer server_code ;

    public String username ;

    public String sip_uri ;
    
    public String alias ;
    
    public String endpoint_id ;
    
    public String password ;
    
    public String resource_uri ;
    
    public String api_id ;
    
    public String error ;
    
    public String message;
    
    public Endpoint() {
        // empty
    }

	public override String toString() {
		return 'Endpoint [serverCode=' + server_code + ', username=' + username
				+ ', sipUri=' + sip_uri + ', alias=' + alias + ', endpointId='
				+ endpoint_id + ', password=' + password + ', resourceUri='
				+ resource_uri + ', apiId=' + api_id + ', error=' + error
				+ ', message=' + message + ']';
	}
}