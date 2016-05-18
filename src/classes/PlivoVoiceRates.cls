public class PlivoVoiceRates {
	public PlivoInboundVoicePricing inbound ;

	public PlivoOutboundVoicePricing outbound ;
	
	public PlivoVoiceRates() {
		// empty
	}

	public override String toString() {
		return 'PlivoVoiceRates [\n voiceInbound=' + inbound + ',\n voiceOutbound='
				+ outbound + '\n ]';
	}
}