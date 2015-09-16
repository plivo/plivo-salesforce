public class PlivoMessage {

    public Integer server_code ;

    public String message ;

    public List<String> message_uuid ;

    public String error ;

    public String api_id ;

    public PlivoMessage() {
        // TODO Auto-generated constructor stub
    }

    public override String toString() {
        return 'PlivoMessageResponse [\n serverCode=' + server_code + ',\n message='
                + message + ',\n messageUuids=' + message_uuid + ',\n error='
                + error + ',\n apiId=' + api_id + '\n]';
    }
}