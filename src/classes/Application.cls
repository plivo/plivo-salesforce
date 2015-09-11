public class Application {
	public Integer server_code ;

    public String fallback_method ;
    
    public Boolean default_app ;
    
    public String app_name ;
    
    public Boolean production_app ;
    
    public String app_id ;
    
    public String hangup_url ;
    
    public String answer_url ;
    
    public String message_url ;
    
    public String resource_uri ;
    
    public String answer_method ;
    
    public String hangup_method ;
    
    public String message_method ;
    
    public String fallback_answer_url ;

    public String error ;
    
    public String api_id ;
    
    public String message;
    
    public Application() {
        // empty
    }

	public override String toString() {
		return 'Application [serverCode=' + server_code + ', fallbackMethod='
				+ fallback_method + ', isDefaultApplication='
				+ default_app + ', applicationName=' + app_name
				+ ', isProductionApplication=' + production_app
				+ ', applicationID=' + app_id + ', hangupUrl='
				+ hangup_url + ', answerUrl=' + answer_url + ', messageUrl='
				+ message_url + ', resourceUri=' + resource_uri
				+ ', answerMethod=' + answer_method + ', hangupMethod='
				+ hangup_method + ', messageMethod=' + message_method
				+ ', fallbackAnswerUrl=' + fallback_answer_url + ', error='
				+ error + ', apiId=' + api_id + ', message=' + message + ']';
	}
}