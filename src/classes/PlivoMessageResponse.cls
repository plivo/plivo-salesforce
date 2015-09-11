public class PlivoMessageResponse {

    public Integer server_code ;

    public String message ;

    public List<String> message_uuid ;

    public String error ;

    public String api_id ;

    public PlivoMessageResponse() {
        // TODO Auto-generated constructor stub
    }

    public override String toString() {
        return 'PlivoMessageResponse [serverCode=' + server_code + ', message='
                + message + ', messageUuids=' + message_uuid + ', error='
                + error + ', apiId=' + api_id + ']';
    }
}