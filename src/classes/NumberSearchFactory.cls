public class NumberSearchFactory {
	public Integer server_code ;

    public NumberMeta meta ;
    
    public String api_id ;
    
    public String error ;
    
    public List<NumberResponse> objects ;
    
    public NumberSearchFactory() {
        // empty
    }

	public override String toString() {
		return 'NumberSearchFactory [serverCode=' + server_code + ', meta='
				+ meta + ', apiId=' + api_id + ', error=' + error
				+ ', numberList=' + objects + ']';
	}
}