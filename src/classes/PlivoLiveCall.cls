public class PlivoLiveCall {
	public Integer server_code ;

    public String direction ;

    public String from_number ;

    public String call_status ;

    public String api_id ;

    public String to ;

    public String caller_name ;

    public String call_uuid ;

    public String session_start ;

    public String error ;

    public PlivoLiveCall() {
        // empty
    }

	public override String toString() {
		return 'PlivoLiveCall [\n serverCode=' + server_code + ',\n direction='
				+ direction + ',\n from=' + from_number + ',\n callStatus=' + call_status
				+ ',\n apiId=' + api_id + ',\n to=' + to + ',\n callerName='
				+ caller_name + ',\n callUuuid=' + call_uuid + ',\n sessionStart='
				+ session_start + ',\n error=' + error + '\n]';
	}

}