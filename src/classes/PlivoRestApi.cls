public class PlivoRestApi{

    public String AUTH_ID;
    private String AUTH_TOKEN;
    public final String PLIVO_URL = 'https://api.plivo.com';
    public String PLIVO_VERSION = 'v1';
    public String BaseURI;
    HttpRequest req;

    public PlivoRestApi(String auth_id, String auth_token, String version1){
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
                if (res.getBody() == '') {
                    res.setBody('{\n"message": ""\n}');
                }
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
        if (jsonn.contains('number')){
            jsonn = jsonn.replace('\"number\": ', '\"plivo_number\": ');
        }
        if (jsonn.contains('from')){
            jsonn = jsonn.replace('\"from\": ', '\"from_number\": ');
        }
        // System.debug('final json : ' + jsonn);
        return jsonn;
    }

    // Account
    // Get details of the account
    public PlivoAccount getAccount() {
        return (PlivoAccount)JSON.deserialize(request('GET', '/', new Map<String, String>()), PlivoAccount.class);
    }

    // Edit details of the account
    public PlivoGenericResponse editAccount(Map<String, String> parameters) {
        return (PlivoGenericResponse)JSON.deserialize(request('POST', '/', parameters), PlivoGenericResponse.class);
    }

    // Get details of all subaccounts
    public PlivoSubAccountFactory getSubaccounts() {
        return (PlivoSubAccountFactory)JSON.deserialize(request('GET', '/Subaccount/', new Map<String, String>()), PlivoSubAccountFactory.class);
    }

    // Get details of a single subaccount
    public PlivoSubAccount getSubaccount(Map<String, String> parameters) {
        String subauth_id = parameters.get('subauth_id');
        String resource_placeHolder = '/Subaccount/{0}/';
        List<String> resource_fillers = new String[]{subauth_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoSubAccount)JSON.deserialize(request('GET', resource, parameters), PlivoSubAccount.class);
    }

    // Create new subaccount
    public PlivoSubAccount createSubaccount(Map<String, String> parameters) {
        return (PlivoSubAccount)JSON.deserialize(request('POST', '/Subaccount/', parameters), PlivoSubAccount.class);
    }

    // Edit details of a subaccount
    public PlivoGenericResponse editSubaccount(Map<String, String> parameters) {
        return (PlivoGenericResponse)JSON.deserialize(request('POST', '/Subaccount/', parameters), PlivoGenericResponse.class);
    }

    // Delete a subaccount
    public PlivoGenericResponse deleteSubaccount(Map<String, String> parameters) {
        String subauth_id = parameters.get('subauth_id');
        String resource_placeHolder = '/Subaccount/{0}/';
        List<String> resource_fillers = new String[]{subauth_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, parameters), PlivoGenericResponse.class);
    }

    // Application
    // Get details of all applications
    public PlivoApplicationFactory getApplications(Map<String, String> parameters) {
        return (PlivoApplicationFactory)JSON.deserialize(request('GET', '/Application/', parameters), PlivoApplicationFactory.class);
    }

    // Get details of a single application
    public PlivoApplication getApplication(Map<String, String> parameters) {
        String app_id = parameters.get('app_id');
        String resource_placeHolder = '/Application/{0}/';
        List<String> resource_fillers = new String[]{app_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoApplication)JSON.deserialize(request('GET', resource, new Map<String, String>()), PlivoApplication.class);
    }

    // Create a new application
    public PlivoApplication createApplication(Map<String, String> parameters) {
        return (PlivoApplication)JSON.deserialize(request('POST', '/Application/', parameters), PlivoApplication.class);
    }

    // Edit details of an application
    public PlivoGenericResponse editApplication(Map<String, String> parameters) {
        String app_id = parameters.get('app_id');
        String resource_placeHolder = '/Application/{0}/';
        List<String> resource_fillers = new String[]{app_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, parameters), PlivoGenericResponse.class);
    }

    // Delete an application
    public PlivoGenericResponse deleteApplication(Map<String, String> parameters) {
        String app_id = parameters.get('app_id');
        String resource_placeHolder = '/Application/{0}/';
        List<String> resource_fillers = new String[]{app_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, parameters), PlivoGenericResponse.class);
    }

    // Call
    // Get Details of All Calls
    public PlivoCDRFactory getCDRs(Map<String, String> parameters) {
        return (PlivoCDRFactory)JSON.deserialize(request('GET', '/Call/', parameters), PlivoCDRFactory.class);
    }

    // Get Details of a Single Call
    public PlivoCDR getCDR(Map<String, String> parameters) {
        String call_uuid =  parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoCDR)JSON.deserialize(request('GET', resource , new Map<String, String>()), PlivoCDR.class);
    }

    // Get All Live Calls
    public PlivoLiveCallFactory getLiveCalls() {
        Map<String, String> parameters= new Map<String, String>();
        parameters.put('status', 'live');
        return (PlivoLiveCallFactory)JSON.deserialize(request('GET', '/Call/', parameters), PlivoLiveCallFactory.class);
    }

    // Get Single Live Call
    public PlivoLiveCall getLiveCall(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        parameters.put('status', 'live');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoLiveCall)JSON.deserialize(request('GET', resource, parameters), PlivoLiveCall.class);
    }

    // Make calls
    public PlivoCall makeCall(Map<String, String> parameters) {
    	String to = parameters.get('to');
    	if (to!=null && to.indexOf('<')!=-1)
    		throw new PlivoException('Use the makeBulkCall() method to make calls to multiple numbers.');
        return (PlivoCall)JSON.deserialize(request('POST', '/Call/', parameters), PlivoCall.class);
    }

    // Make Bulk Calls
    public PlivoBulkCall makeBulkCall(Map<String, String> parameters) {
    	String to = parameters.get('to');
    	if (to!=null && to.indexOf('<')==-1)
    		throw new PlivoException('Use the makeCall() method to make a call to a single number.');
        return (PlivoBulkCall)JSON.deserialize(request('POST', '/Call/', parameters), PlivoBulkCall.class);
    }

    // Hangup All Calls
    public PlivoGenericResponse hangupAllCalls() {
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', '/Call/', new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Hangup a Single Call
    public PlivoGenericResponse hangupCall(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Transfer a Call
    public PlivoTransferResponse transferCall(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoTransferResponse)JSON.deserialize(request('POST', resource, parameters), PlivoTransferResponse.class);
    }

    // Record a Call
    public PlivoRecord record(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Record/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoRecord)JSON.deserialize(request('POST', resource, parameters), PlivoRecord.class);
    }

    // Stop recording a Call
    public PlivoGenericResponse stopRecord(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Record/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Play sound on a Call
    public PlivoGenericResponse play(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Play/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource , parameters), PlivoGenericResponse.class);
    }

    // Stop Playing sound on a Call
    public PlivoGenericResponse stopPlay(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Play/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource , new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Speak text on a call
    public PlivoGenericResponse speak(Map<String, String> parameters) {
	    String text = parameters.get('text');
		parameters.put('text', text);
		String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Speak/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource , parameters), PlivoGenericResponse.class);
    }

    // Stop Speaking
    public PlivoGenericResponse stopSpeak(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/Speak/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Send Digits
    public PlivoGenericResponse sendDigits(Map<String, String> parameters) {
        String call_uuid = parameters.get('call_uuid');
        String resource_placeHolder = '/Call/{0}/DTMF/';
        List<String> resource_fillers = new String[]{call_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, parameters), PlivoGenericResponse.class);
    }

    // Endpoint

    public PlivoEndpointFactory getEndpoints(Map<String, String> parameters) {
        return (PlivoEndpointFactory)JSON.deserialize(request('GET', '/Endpoint/', parameters), PlivoEndpointFactory.class);
    }

    public PlivoEndpoint createEndpoint(Map<String, String> parameters) {
        return (PlivoEndpoint)JSON.deserialize(request('POST', '/Endpoint/', parameters), PlivoEndpoint.class);
    }

    public PlivoEndpoint getEndpoint(Map<String, String> parameters) {
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoEndpoint)JSON.deserialize(request('GET', resource, new Map<String, String>()), PlivoEndpoint.class);
    }

    public PlivoGenericResponse editEndpoint(Map<String, String> parameters) {
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, parameters), PlivoGenericResponse.class);
    }

    public PlivoGenericResponse deleteEndpoint(Map<String, String> parameters) {
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Messages
    // Send a Message
    public PlivoMessage sendMessage(Map<String, String> parameters){
        // System.debug('inside sendMessage');
        return (PlivoMessage)JSON.deserialize(request('POST', '/Message/', parameters), PlivoMessage.class);
    }

    // Get Details of a Single Message
    public PlivoMDR getMessage(Map<String, String> parameters){
        String message_uuid = parameters.get('message_uuid');
        String resource_placeHolder = '/Message/{0}/';
        List<String> resource_fillers = new String[]{message_uuid};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoMDR)JSON.deserialize(request('GET', resource , new Map<String, String>()), PlivoMDR.class);
    }

    // Get Details of All Messages
    public PlivoMDRFactory getMessages(Map<String, String> parameters){
        return (PlivoMDRFactory)JSON.deserialize(request('GET', '/Message/', parameters), PlivoMDRFactory.class);
    }
}