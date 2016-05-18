public class PlivoOutboundVoicePricing {
	public PlivoLocalOutboundPricing local ;
	
	public PlivoTollfreeOutboundPricing tollfree ;
	
	public PlivoSipOutboundPricing ip ;
	
	public List<PlivoRatesPrefixes> rates ;
	
	public PlivoOutboundVoicePricing() {
		// empty
	}

	public override String toString() {
		return 'PlivoOutboundVoicePricing [\nlocalOutbound=' + local
				+ ',\n tollfreeOutbound=' + tollfree + ',\n ipOutbound='
				+ ip + ',\n prefixesRates=' + rates + '\n]';
	}
}