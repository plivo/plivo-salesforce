public class PhoneNumberSearchFactory {
    public NumberMeta meta;
    
    public String api_id;
    
    public String error;
    
    public List<PhoneNumber> objects;
    
    public PhoneNumberSearchFactory() {
        // empty
    }

	public override String toString() {
		return 'PhoneNumberSearchFactory [meta=' + meta + ', apiId=' + api_id
				+ ', error=' + error + ', numberList=' + objects + ']';
	}
}