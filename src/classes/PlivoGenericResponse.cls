public class PlivoGenericResponse {
	public Integer server_code ;

    public String message ;

    public String error ;

    public String api_id ;

    public PlivoGenericResponse() {
        // empty
    }

	public override String toString() {
		return 'PlivoGenericResponse [\n serverCode=' + server_code + ',\n message='
				+ message + ',\n error=' + error + ',\n apiId=' + api_id + '\n]';
	}
}