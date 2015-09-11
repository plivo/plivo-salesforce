public class PlivoBulkCall {
	public Integer server_code ;

    public String message;

    public List<String> request_uuid ;

    public String api_id ;

    public String error;

	public override String toString() {
		return 'PlivoCall {\nserverCode: ' + server_code
				+ '\nmessage: ' + message + '\nrequestUUID: ' + request_uuid
				+ '\napiId: ' + api_id + '\nerror: ' + error + '\n}';
	}

}