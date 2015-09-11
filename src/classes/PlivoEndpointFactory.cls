public class PlivoEndpointFactory {
	public Integer server_code ;

    public EndpointMeta meta ;

    public String error ;

    public String api_id ;

    public List<Endpoint> objects ;

    public PlivoEndpointFactory() {
        // empty
    }

	public override String toString() {
		return 'PlivoEndpointFactory [serverCode=' + server_code + ', meta=' + meta
				+ ', error=' + error + ', apiId=' + api_id + ', endpointList='
				+ objects + ']';
	}
}