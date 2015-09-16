public class PlivoConference {
	public Integer server_code ;

    public String conference_name ;
    
    public String conference_run_time ;
    
    public String conference_member_count ;
    
    public List<PlivoConferenceMember> members ;
    
    public String api_id ;
    
    public String error ;
    
    public PlivoConference() {
        // empty
    }

	public override String toString() {
		return 'Conference [serverCode=' + server_code + ', conferenceName='
				+ conference_name + ', conferenceRunTime=' + conference_run_time
				+ ', conferenceMemberCount=' + conference_member_count
				+ ', members=' + members + ', apiId=' + api_id + ', error='
				+ error + ']';
	}
}