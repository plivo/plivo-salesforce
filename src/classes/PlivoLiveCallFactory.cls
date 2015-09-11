public class PlivoLiveCallFactory {
	public Integer server_code ;

    public String api_id ;

    public List<String> calls ;

    public String error ;

    public PlivoLiveCallFactory() {
        // empty
    }

	public override String toString() {
		return 'PlivoLiveCallFactory [\n serverCode=' + server_code + ',\n apiId=' + api_id
				+ ',\n liveCallList=' + calls + ',\n error=' + error + '\n]';
	}

}