public class PlivoCDRFactory {
	public Integer server_code ;

    public PlivoCDRMeta meta ;

    public String error ;

    public String api_id ;

    public List<PlivoCDR> objects ;

    public PlivoCDRFactory() {
    	// empty
    }

	public override String toString() {
		return 'PlivoCDRFactory [\n serverCode=' + server_code + ',\n meta=' + meta
				+ ',\n error=' + error + ',\n apiId=' + api_id + ',\n Objects='
				+ objects + '\n]';
	}

}