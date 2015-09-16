public class PlivoSmsRates {
	public PlivoInboundSmsPricing inbound ;
	
	public PlivoOutboundSmsPricing outbound ;
	
	public PlivoSmsRates() {
		// empty
	}

	public override String toString() {
		return 'PlivoSmsRates [\n inboundSms=' + inbound + ',\n outboundSms='
				+ outbound + '\n]';
	}
}