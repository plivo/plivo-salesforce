public class LiveCallFactory {
	public Integer server_code ;

    public String api_id ;
    
    public List<String> calls ;
    
    public String error ;
    
    public LiveCallFactory() {
        // empty
    }

	public override String toString() {
		return 'LiveCallFactory [\n serverCode=' + server_code + ',\n apiId=' + api_id
				+ ',\n liveCallList=' + calls + ',\n error=' + error + '\n]';
	}
    
}