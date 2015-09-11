public class PlivoSubAccountFactory {
	public Integer server_code ;

    public SubAccountMeta meta ;

    public String error ;

    public String api_id ;

    public List<SubAccount> objects;

    public PlivoSubAccountFactory() {
        // empty
    }

	public override String toString() {
		return 'PlivoSubAccountFactory [serverCode=' + server_code + ', meta=' + meta + ', error=' + error + ', apiId=' + api_id + ', subAccountList=' + objects + ']';
	}
}