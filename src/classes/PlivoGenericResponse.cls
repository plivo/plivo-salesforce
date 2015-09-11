public class PlivoGenericResponse {
	public Integer server_code ;

    public String resp_message ;

    public String resp_error ;

    public String api_id ;

    public PlivoGenericResponse() {
        // empty
    }

	public override String toString() {
		return 'PlivoGenericResponse [\n serverCode=' + server_code + ',\n message='
				+ resp_message + ',\n error=' + resp_error + ',\n apiId=' + api_id + '\n]';
	}
}