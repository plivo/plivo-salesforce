public class PlivoPhoneNumberSearchFactory {
    public NumberMeta meta;

    public String api_id;

    public String error;

    public List<PhoneNumber> objects;

    public PlivoPhoneNumberSearchFactory() {
        // empty
    }

	public override String toString() {
		return 'PlivoPhoneNumberSearchFactory [meta=' + meta + ', apiId=' + api_id
				+ ', error=' + error + ', numberList=' + objects + ']';
	}
}