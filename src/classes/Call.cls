public class Call {
	public Integer server_code ;

    public String message;
    
    public String request_uuid ;
    
    public String api_id ;
    
    public String error;
    
    public Call() {
        // empty
    }

	public override String toString() {
		return 'Call [\n serverCode=' + server_code + ',\n message=' + message
				+ ',\n requestUUID=' + request_uuid + ',\n apiId=' + api_id
				+ ',\n error=' + error + '\n]';
	}
    
}