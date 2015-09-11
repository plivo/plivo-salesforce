public class PlivoCDR {
	public Integer server_code ;

    public Integer bill_duration ;

    public Integer billed_duration ;

    public Integer call_duration ;

    public String total_amount ;

    public String parent_call_uuid ;

    public String call_direction ;

    public String to_number ;

    public String total_rate ;

    public String from_number ;

    public String end_time ;

    public String call_uuid ;

    public String resource_uri ;

    public String error ;

    public String api_id ;

    public PlivoCDR() {
        // empty
    }

	public override String toString() {
		return 'PlivoCDR [\n serverCode=' + server_code + ',\n billDuration='
				+ bill_duration + ',\n billedDuration=' + billed_duration
				+ ',\n callDuration=' + call_duration + ',\n totalAmount='
				+ total_amount + ',\n parentCallUUID=' + parent_call_uuid
				+ ',\n callDirection=' + call_direction + ',\n toNumber=' + to_number
				+ ',\n totalRate=' + total_rate + ',\n fromNumber=' + from_number
				+ ',\n endTime=' + end_time + ',\n callUUID=' + call_uuid
				+ ',\n resourceUri=' + resource_uri + ',\n error=' + error
				+ ',\n apiId=' + api_id + '\n]';
	}

}