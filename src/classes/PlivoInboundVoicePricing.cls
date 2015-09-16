public class PlivoInboundVoicePricing {
	public PlivoLocalInboundPricing local ;
	
	public PlivoTollfreeInboundPricing tollfree ;
	
	public PlivoSipInboundPricing ip ;
	
	public PlivoInboundVoicePricing() {
		// empty
	}

	public override String toString() {
		return 'PlivoInboundVoicePricing [\n localInbound=' + local
				+ ',\n tollfreeInbound=' + tollfree + ',\n ipInboundRate='
				+ ip + '\n]';
	}
}