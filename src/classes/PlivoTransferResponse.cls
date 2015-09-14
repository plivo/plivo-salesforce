public class PlivoTransferResponse {
    public Integer server_code ;

    public String message ;
    
    public List<String> calls ;
    
    public String error ;
    
    public String api_id ;
    
    public PlivoTransferResponse() {
        // empty
    }

    public override String toString() {
        return 'GenericResponse [\n serverCode=' + server_code + ',\n message='
                + message + 'Call UUIDs=' + calls + ',\n error=' + error + ',\n apiId=' + api_id + '\n]';
    }
}