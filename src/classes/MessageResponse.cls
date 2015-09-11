public class MessageResponse {

    public Integer server_code ;

    public String message ;
    
    public List<String> message_uuid ;
    
    public String error ;
    
    public String api_id ;
    
    public MessageResponse() {
        // TODO Auto-generated constructor stub
    }

    public override String toString() {
        return 'MessageResponse [serverCode=' + server_code + ', message='
                + message + ', messageUuids=' + message_uuid + ', error='
                + error + ', apiId=' + api_id + ']';
    }
}