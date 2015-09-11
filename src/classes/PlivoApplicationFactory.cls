public class PlivoApplicationFactory {
	public Integer server_code ;

    public List<PlivoApplication> objects ;

    public PlivoApplicationMeta meta ;

    public String api_id ;

    public String error ;

    public PlivoApplicationFactory() {
            //empty
    }

	public override String toString() {
		return 'PlivoApplicationFactory [serverCode=' + server_code
				+ ', applicationList=' + objects + ', meta=' + meta
				+ ', apiId=' + api_id + ', error=' + error + ']';
	}
}