public class PlivoNumberSearchFactory {
	public Integer server_code ;

    public PlivoNumberMeta meta ;

    public String api_id ;

    public String error ;

    public List<PlivoNumberResponse> objects ;

    public PlivoNumberSearchFactory() {
        // empty
    }

	public override String toString() {
		return 'PlivoNumberSearchFactory [serverCode=' + server_code + ', meta='
				+ meta + ', apiId=' + api_id + ', error=' + error
				+ ', numberList=' + objects + ']';
	}
}