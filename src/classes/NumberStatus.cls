public class NumberStatus {
    public String plivo_number ;
	
    public String status ;
    
	public NumberStatus() {
		// empty
	}

	public override String toString() {
		return 'NumberStatus [number=' + plivo_number + ', status=' + status + ']';
	}
}