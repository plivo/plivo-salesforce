public class PlivoMessageFactory {

	public Integer server_code ;

    public MessageMeta meta ;

    public String api_id ;

    public List<Message> objects ;

    public String error;

    public PlivoMessageFactory() {
        // empty
    }

	public override String toString() {
		return 'PlivoMessageFactory [\n serverCode=' + server_code + ',\n meta=' + meta + ',\n apiId=' + api_id + ',\n messageList=' + objects + ',\n error=' + error + '\n]';
	}
}