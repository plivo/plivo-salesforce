public class PlivoConferenceMember {
    public Boolean muted ;
    
    public String member_id ;
    
    public Boolean deaf ;
    
    public String from_number ;
    
    public String to ;
    
    public String caller_name ;
    
    public String direction ;
    
    public String call_uuid ;
    
    public String join_time ;
    
    public PlivoConferenceMember() {
        // empty
    }

	public override String toString() {
		return 'ConferenceMember [muted=' + muted + ', memberId=' + member_id
				+ ', deaf=' + deaf + ', from=' + from_number + ', to=' + to
				+ ', callerName=' + caller_name + ', direction=' + direction
				+ ', callUUID=' + call_uuid + ', joinTime=' + join_time + ']';
	}
}