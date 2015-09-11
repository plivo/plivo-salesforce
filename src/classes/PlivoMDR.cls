public class PlivoMDR {
    public String cloud_rate ;

    public String carrier_rate ;

    public String message_direction ;

    public String to_number ;

    public String message_state ;

    public String total_amount ;

    public String from_number ;

    public String message_uuid ;

    public String message_time ;

    public String resource_uri ;

    public String message_type ;

    public String total_rate ;

    public Integer units ;

    public String error ;

    public String api_id ;

    public PlivoMDR() {
        // empty
    }

	public override String toString() {
		return 'PlivoMessage [\n cloudRate=' + cloud_rate + ',\n carrierRate=' + carrier_rate + ',\n messageDirection=' + message_direction + ',\n toNumber=' + to_number + ',\n messageState=' + message_state + ',\n totalAmount=' + total_amount + ',\n fromNumber=' + from_number + ',\n messageUUID=' + message_uuid + ',\n messageTime=' + message_time + ',\n resourceUri=' + resource_uri+ ',\n messageType=' + message_type + ',\n totalRate=' + total_rate + ',\n units=' + units + ',\n error=' + error + ',\n apiId=' + api_id + '\n]';
	}
}