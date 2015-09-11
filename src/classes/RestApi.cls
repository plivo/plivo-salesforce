public class RestApi{
    
    public String AUTH_ID;
    private String AUTH_TOKEN;
    public final String PLIVO_URL = 'https://api.plivo.com';
    public String PLIVO_VERSION = 'v1';
    public String BaseURI;
    HttpRequest req;  
    
    public RestApi(String auth_id, String auth_token, String version1){
        AUTH_ID = auth_id;
        AUTH_TOKEN = auth_token;
        PLIVO_VERSION = version1;
        String baseuri_placeHolder = '{0}/{1}/Account/{2}';
        List<String> baseuri_fillers = new String[]{PLIVO_URL,PLIVO_VERSION,AUTH_ID};
        BaseURI = String.format(baseuri_placeHolder,baseuri_fillers);
        
        // Create Request
        req = new HttpRequest();
        
        // Request Authorization
        Blob headerValue = Blob.valueOf(auth_id + ':' + auth_token);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        
        // Set Authorization Header
        req.setHeader('Authorization', authorizationHeader);
    }
    
    public String request(String method, String resource, Map<String, String> parameters){
        // Create Resposne
        Http http = new Http();
        HTTPResponse res;
        String jsonn = '';
        String final_json = '';
        try {
            if ( method == 'GET' ) {
                String getparams = '?';
                for (String key : parameters.keySet()){
                    getparams += key + '=' + parameters.get(key) + '&';
                }
                getparams = getparams.substring(0, getparams.length() - 1);
                // Endpoint
                String endpoint = BaseURI + resource + getparams;
                // Set Method & Endpoint
                req.setMethod(method);
                req.setEndpoint(endpoint);
                // Send request
                res = http.send(req);
                // System.debug(res.getBody());                
            } 
            else if ( method == 'POST' ) {
                String serialized = JSON.serialize(parameters);
                // System.debug('params:'+serialized);
                // Endpoint
                String endpoint = BaseURI + resource;
                // Set Method & Endpoint
                req.setMethod(method);
                req.setEndpoint(endpoint);
                // Set Header & Body
                req.setHeader('Content-Type', 'application/json');
                req.setBody(serialized);
                // Send request
                res = http.send(req);
                // System.debug('status code:'+res.getStatusCode());
                // System.debug('res body:'+res.getBody());
            }    
            else if ( method == 'DELETE' ){
                // Endpoint
                String endpoint = BaseURI + resource;
                // Set Method & Endpoint
                req.setMethod(method);
                req.setEndpoint(endpoint);
                // Send request
                res = http.send(req);
                // System.debug('status code:'+res.getStatusCode());
                // System.debug('res body:'+res.getBody());
            }
        } catch( CalloutException e){
            throw new PlivoException(e.getStackTraceString());
        }
        
        Integer server_code = res.getStatusCode();
        String code = String.valueOf(server_code);
        String resp = res.getBody();
        String replace = '\"server_code\": "{0}",';
        List<String> replace_with = new String[]{code};
        String replaced = String.format(replace,replace_with);
        String final_replace = '{ ' + replaced;
        jsonn = resp.replaceFirst('\\{', final_replace);
        if (jsonn.contains('limit')){
            jsonn = jsonn.replace('\"limit\": ', '\"limitt\": ');
        }
        // System.debug('final json : ' + jsonn);
        return jsonn;
    }
    
    // Account
    // Get details of the account
    public Account getAccount() {
        return (Account)JSON.deserialize(request('GET', '/', new Map<String, String>()), Account.class);
    }
    
    // Edit details of the account 
    public GenericResponse editAccount(Map<String, String> parameters) {
        return (GenericResponse)JSON.deserialize(request('POST', '/', parameters), GenericResponse.class);      
    }
    
    // Get details of all subaccounts
    public SubAccountFactory getSubaccounts() {
        return (SubAccountFactory)JSON.deserialize(request('GET', '/Subaccount/', new Map<String, String>()), SubAccountFactory.class);
    }
    
    // Get details of a single subaccount
    public SubAccount getSubaccount(Map<String, String> parameters) {
        String subauth_id = parameters.get('subauth_id');
        String resource_placeHolder = '/Subaccount/{0}/';
        List<String> resource_fillers = new String[]{subauth_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (SubAccount)JSON.deserialize(request('GET', resource, parameters), SubAccount.class);
    }
    
    // Create new subaccount
    public SubAccount createSubaccount(Map<String, String> parameters) {
        return (SubAccount)JSON.deserialize(request('POST', '/Subaccount/', parameters), SubAccount.class);
    }
    
    // Edit details of a subaccount
    public GenericResponse editSubaccount(Map<String, String> parameters) {
        return (GenericResponse)JSON.deserialize(request('POST', '/Subaccount/', parameters), GenericResponse.class);
    }
    
    // Delete a subaccount
    public GenericResponse deleteSubaccount(Map<String, String> parameters) {
        String subauth_id = parameters.get('subauth_id');
        String resource_placeHolder = '/Subaccount/{0}/';
        List<String> resource_fillers = new String[]{subauth_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('DELETE', resource, parameters), GenericResponse.class);
    }
    
    // Application
    // Get details of all applications
    public ApplicationFactory getApplications(Map<String, String> parameters) {
        return (ApplicationFactory)JSON.deserialize(request('GET', '/Application/', parameters), ApplicationFactory.class);
    }
    
    // Get details of a single application
    public Application getApplication(Map<String, String> parameters) {
        String app_id = parameters.get('app_id');
        String resource_placeHolder = '/Application/{0}/';
        List<String> resource_fillers = new String[]{app_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (Application)JSON.deserialize(request('GET', resource, new Map<String, String>()), Application.class);
    }
    
    // Create a new application
    public Application createApplication(Map<String, String> parameters) {
        return (Application)JSON.deserialize(request('POST', '/Application/', parameters), Application.class);
    }
    
    // Edit details of an application
    public GenericResponse editApplication(Map<String, String> parameters) {
        String app_id = parameters.get('app_id');
        String resource_placeHolder = '/Application/{0}/';
        List<String> resource_fillers = new String[]{app_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('POST', resource, parameters), GenericResponse.class);
    }
    
    // Delete an application
    public GenericResponse deleteApplication(Map<String, String> parameters) {
        String app_id = parameters.get('app_id');
        String resource_placeHolder = '/Application/{0}/';
        List<String> resource_fillers = new String[]{app_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('DELETE', resource, parameters), GenericResponse.class);
    }
    
    // Call
    // Get Details of All Calls
    public CDRFactory getCDRs(Map<String, String> parameters) {
        return (CDRFactory)JSON.deserialize(request('GET', '/Call/', parameters), CDRFactory.class);
    }
    
    // Get Details of a Single Call
    public CDR getCDR(Map<String, String> parameters) {
        String call_uuid =  parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (CDR)JSON.deserialize(request('GET', resource , new Map<String, String>()), CDR.class);
    }
    
    // Get All Live Calls
    public LiveCallFactory getLiveCalls() {
        Map<String, String> parameters= new Map<String, String>();
        parameters.put('status', 'live');
        return (LiveCallFactory)JSON.deserialize(request('GET', '/Call/', parameters), LiveCallFactory.class);
    }
    
    // Get Single Live Call
    public LiveCall getLiveCall(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        parameters.put('status', 'live');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (LiveCall)JSON.deserialize(request('GET', resource, parameters), LiveCall.class);
    }
    
    // Make calls 
    public Call makeCall(Map<String, String> parameters) {
    	String to = parameters.get('to');
    	if (to!=null && to.indexOf('<')!=-1)
    		throw new PlivoException('Use the makeBulkCall() method to make calls to multiple numbers.');
        return (Call)JSON.deserialize(request('POST', '/Call/', parameters), Call.class);
    }
    
    // Make Bulk Calls
    public BulkCall makeBulkCall(Map<String, String> parameters) {
    	String to = parameters.get('to');
    	if (to!=null && to.indexOf('<')==-1)
    		throw new PlivoException('Use the makeCall() method to make a call to a single number.');
        return (BulkCall)JSON.deserialize(request('POST', '/Call/', parameters), BulkCall.class);
    }
    
    // Hangup All Calls
    public GenericResponse hangupAllCalls() {
        return (GenericResponse)JSON.deserialize(request('DELETE', '/Call/', new Map<String, String>()), GenericResponse.class);
    }
    
    // Hangup a Single Call
    public GenericResponse hangupCall(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), GenericResponse.class);
    }
    
    // Transfer a Call
    public GenericResponse transferCall(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('POST', resource, parameters), GenericResponse.class);
    }
    
    // Record a Call
    public Record record(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Record/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (Record)JSON.deserialize(request('POST', resource, parameters), Record.class);
    }
    
    // Stop recording a Call
    public GenericResponse stopRecord(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Record/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), GenericResponse.class);
    }
    
    // Play sound on a Call
    public GenericResponse play(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Play/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('POST', resource , parameters), GenericResponse.class);
    }

    // Stop Playing sound on a Call
    public GenericResponse stopPlay(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Play/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('DELETE', resource , new Map<String, String>()), GenericResponse.class);
    }
    
    // Speak text on a call
    public GenericResponse speak(Map<String, String> parameters) {
	    String text = parameters.get('text');
		parameters.put('text', text);
		String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Speak/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('POST', resource , parameters), GenericResponse.class);
    }

    // Stop Speaking
    public GenericResponse stopSpeak(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Speak/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), GenericResponse.class);
    }

    // Send Digits
    public GenericResponse sendDigits(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/DTMF/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('POST', resource, parameters), GenericResponse.class);
    }
    
    // Endpoint
    
    public EndpointFactory getEndpoints(Map<String, String> parameters) {
        return (EndpointFactory)JSON.deserialize(request('GET', '/Endpoint/', parameters), EndpointFactory.class);
    }

    public Endpoint createEndpoint(Map<String, String> parameters) {
        return (Endpoint)JSON.deserialize(request('POST', '/Endpoint/', parameters), Endpoint.class);
    }

    public Endpoint getEndpoint(Map<String, String> parameters) { 
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (Endpoint)JSON.deserialize(request('GET', resource, new Map<String, String>()), Endpoint.class);
    }

    public GenericResponse editEndpoint(Map<String, String> parameters) {
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('POST', resource, parameters), GenericResponse.class);
    }

    public GenericResponse deleteEndpoint(Map<String, String> parameters) {
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (GenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), GenericResponse.class);
    }
    
    // Messages
    // Send a Message
    public MessageResponse sendMessage(Map<String, String> parameters){
        // System.debug('inside sendMessage');
        return (MessageResponse)JSON.deserialize(request('POST', '/Message/', parameters), MessageResponse.class);
    }
    
    // Get Details of a Single Message
    public Message getMessage(Map<String, String> parameters){
        String message_uuid = parameters.get('message_uuid');
        String resource_placeHolder = '/Message/{0}/';
        List<String> resource_fillers = new String[]{message_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (Message)JSON.deserialize(request('GET', resource , new Map<String, String>()), Message.class);
    }
    
    // Get Details of All Messages
    public MessageFactory getMessages(Map<String, String> parameters){
        return (MessageFactory)JSON.deserialize(request('GET', '/Message/', parameters), MessageFactory.class);
    }
}