public class EndpointFactory {
	public Integer server_code ;

    public EndpointMeta meta ;
    
    public String error ;
    
    public String api_id ;
    
    public List<Endpoint> objects ;
    
    public EndpointFactory() {
        // empty
    }

	public override String toString() {
		return 'EndpointFactory [serverCode=' + server_code + ', meta=' + meta
				+ ', error=' + error + ', apiId=' + api_id + ', endpointList='
				+ objects + ']';
	}
}