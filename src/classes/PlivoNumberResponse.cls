public class PlivoNumberResponse {
  public Integer server_code ;

    public String region ;

    public Boolean voice_enabled ;

    public Boolean sms_enabled ;
    
    public Boolean active ;

    public String plivo_number ;

    public String api_id ;

    public String voice_rate ;

    public String application ;

    public String sms_rate ;

    public String number_type ;

    public String sub_account ;

    public String added_on ;

    public String resource_uri ;

    public String prefix ;

    public String rental_rate ;

    public String setup_rate ;

    public String error;

    public String carrier ;
    
    public String alias;
    
    public String monthly_rental_rate;
    
    public String type;

    public PlivoNumberResponse() {
        // empty
    }

  public override String toString() {
    return 'PlivoNumber [serverCode=' + server_code + ', region=' + region
        + ', isVoiceEnabled=' + voice_enabled + ', isSmsEnabled='
        + sms_enabled + ', number='
        + plivo_number + ', apiId=' + api_id + ', voiceRate=' + voice_rate
        + ', application=' + application + ', smsRate=' + sms_rate
        + ', numberType=' + number_type + ', subAccount=' + sub_account
        + ', addedOn=' + added_on + ', resourceUri=' + resource_uri
        + ', numberPrefix=' + prefix + ', rentalRate='
        + rental_rate + ', setupRate=' + setup_rate + ', error=' + error + ', inboundCarrier='
        + carrier + ', active=' + active + ', alias=' + alias + ', monthlyRentalRate=' 
        + monthly_rental_rate + ', type=' + type + ']';
  }
}