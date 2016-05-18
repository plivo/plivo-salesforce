public class PlivoLiveConferenceFactory {
	public Integer server_code ;

    public String error ;

    public String api_id ;
    
    public List<String> conferences ;
    
    public PlivoLiveConferenceFactory() {
        // empty
    }

	public override String toString() {
		return 'LiveConferenceFactory [serverCode=' + server_code + ', error='
				+ error + ', apiId=' + api_id + ', conferences=' + conferences
				+ ']';
	}
}