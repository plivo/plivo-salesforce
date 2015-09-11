public class PlivoPhoneNumber {
    public String country ;

    public Integer lata ;

    public String monthly_rental_rate ;

    public String plivo_number;

    public String type;

    public String prefix ;

    public String rate_center;

    public String region;

    public String resource_uri;

    public String restriction;

    public String restriction_text;

    public String setup_rate ;

    public Boolean voice_enabled;

    public Boolean sms_enabled;

    public String voice_rate ;

    public String sms_rate ;

    public PlivoPhoneNumber() {
        // empty
    }

	public override String toString() {
		return 'PlivoPhoneNumber [country=' + country + ', lata=' + lata
				+ ', monthlyRentalRrate=' + monthly_rental_rate + ', number='
				+ plivo_number + ', type=' + type + ', numberPrefix=' + prefix
				+ ', rateCenter=' + rate_center + ', region=' + region
				+ ', resourceURI=' + resource_uri + ', restriction='
				+ restriction + ', restriction_text=' + restriction_text
				+ ', setupRate=' + setup_rate + ', isVoiceEnabled='
				+ voice_enabled + ', isSmsEnabled=' + sms_enabled
				+ ', voiceRate=' + voice_rate + ', smsRate=' + sms_rate + ']';
	}
}