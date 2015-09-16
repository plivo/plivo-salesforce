public class PlivoPricing {
	public Integer server_code ;

	public String country_code ;
	
	public String country_iso;
	
	public String country ;
	
	public String api_id ;
	
	public PlivoPhoneNumbers phone_numbers ;
	
	public PlivoVoiceRates voice ;
	
	public PlivoSmsRates message ;
	
	public PlivoPricing() {
		// empty
	}

	public override String toString() {
		return 'PlivoPricing [\n serverCode=' + server_code + ',\n countryCode='
				+ country_code + ',\n countryIso=' + country_iso + ',\n country='
				+ country + ',\n apiId=' + api_id + ',\n phoneNumbers='
				+ phone_numbers + ',\n voiceRates=' + voice + ',\n smsRates='
				+ message + '\n]';
	}
}