public class PlivoRecord {
	public Integer server_code ;

    public String resp_url;

    public String resp_message;

    public String resp_error;

    public String api_id;

    public PlivoRecord() {
        // empty
    }

	public override String toString() {
		return 'PlivoRecord [\n serverCode=' + server_code + ',\n url=' + resp_url
				+ ',\n message=' + resp_message + ',\n error=' + resp_error + ',\n api_id='
				+ api_id + '\n]';
	}
}