public class PlivoRecord {
	public Integer server_code ;

    public String url;

    public String message;

    public String error;

    public String api_id;

    public String recording_id;

    public PlivoRecord() {
        // empty
    }

	public override String toString() {
		return 'PlivoRecord [\n serverCode=' + server_code + ',\n url=' + url
				+ ',\n message=' + message + ',\n recording_id =' + recording_id + ',\n error=' + error + ',\n api_id='
				+ api_id + '\n]';
	}
}