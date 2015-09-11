public class PlivoCall {
	public Integer server_code ;

    public String message;

    public String request_uuid ;

    public String api_id ;

    public String error;

    public PlivoCall() {
        // empty
    }

	public override String toString() {
		return 'PlivoCall [\n serverCode=' + server_code + ',\n message=' + message
				+ ',\n requestUUID=' + request_uuid + ',\n apiId=' + api_id
				+ ',\n error=' + error + '\n]';
	}

}