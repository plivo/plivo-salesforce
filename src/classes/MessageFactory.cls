public class MessageFactory {

	public Integer server_code ;

    public MessageMeta meta ;

    public String api_id ;
    
    public List<Message> objects ;
    
    public String error;
    
    public MessageFactory() {
        // empty
    }

	public override String toString() {
		return 'MessageFactory [\n serverCode=' + server_code + ',\n meta=' + meta + ',\n apiId=' + api_id + ',\n messageList=' + objects + ',\n error=' + error + '\n]';
	}
}