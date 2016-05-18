public class PlivoRatesPrefixes {
    public String rate ;
	
	public List<String> prefix ;
	
	public PlivoRatesPrefixes() {
		// empty
	}

	public override String toString() {
		return 'PlivoRatesPrefixes [\n rate=' + rate + ',\n numberPrefixes='
				+ prefix + '\n]';
	}
}