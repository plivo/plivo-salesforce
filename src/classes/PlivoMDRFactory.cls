public class PlivoMDRFactory {

	public Integer server_code ;

    public PlivoMDRMeta meta ;

    public String api_id ;

    public List<PlivoMDR> objects ;

    public String error;

    public PlivoMDRFactory() {
        // empty
    }

	public override String toString() {
		return 'PlivoMessageFactory [\n serverCode=' + server_code + ',\n meta=' + meta + ',\n apiId=' + api_id + ',\n messageList=' + objects + ',\n error=' + error + '\n]';
	}
}