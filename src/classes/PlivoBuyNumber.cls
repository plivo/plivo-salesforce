public class PlivoBuyNumber {
    public List<NumberStatus> numbers ;

    public String status ;

    public String error ;

    public String api_id;

    public PlivoBuyNumber() {
        // empty
    }

	public override String toString() {
		return 'PlivoNumberResponse [numberStatusList=' + numbers
				+ ', status=' + status + ', error=' + error + ', apiId='
				+ api_id + ']';
	}
}