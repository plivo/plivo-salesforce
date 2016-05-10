public class PlivoPhoneNumberSearchFactory {
    public Integer server_code ;
    
    public PlivoNumberMeta meta;

    public String api_id;

    public String error;

    public List<PlivoPhoneNumber> objects;

    public PlivoPhoneNumberSearchFactory() {
        // empty
    }

  public override String toString() {
    return 'ServerCode=' + server_code + ' PlivoPhoneNumberSearchFactory [meta=' + meta + ', apiId=' + api_id
        + ', error=' + error + ', numberList=' + objects + ']';
  }
}