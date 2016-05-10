public class PlivoBuyNumber {
    public Integer server_code;
    
    public List<PlivoNumberStatus> numbers ;

    public String status ;
    
    public String message ;
    
    public String error ;

    public String api_id;

    public PlivoBuyNumber() {
        // empty
    }

  public override String toString() {
    return 'ServerCode=' + server_code + ' PlivoNumberResponse [numberStatusList=' + numbers
        + ', status=' + status + ', error=' + error + ', apiId='
        + api_id + ', message=' + message + ']';
  }
}