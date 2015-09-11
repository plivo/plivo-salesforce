public class BuyNumber {
    public List<NumberStatus> numbers ;
    
    public String status ;
    
    public String error ;
    
    public String api_id;
    
    public BuyNumber() {
        // empty
    }

	public override String toString() {
		return 'NumberResponse [numberStatusList=' + numbers
				+ ', status=' + status + ', error=' + error + ', apiId='
				+ api_id + ']';
	}
}