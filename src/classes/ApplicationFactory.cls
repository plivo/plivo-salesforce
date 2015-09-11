public class ApplicationFactory {
	public Integer server_code ;

    public List<Application> objects ;
    
    public ApplicationMeta meta ;
    
    public String api_id ;
    
    public String error ;
    
    public ApplicationFactory() {
            //empty
    }

	public override String toString() {
		return 'ApplicationFactory [serverCode=' + server_code
				+ ', applicationList=' + objects + ', meta=' + meta
				+ ', apiId=' + api_id + ', error=' + error + ']';
	}
}