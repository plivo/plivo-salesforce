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
    public PlivoSubAccountFactory getSubaccounts(Map<String, String> parameters) {
        return (PlivoSubAccountFactory)JSON.deserialize(request('GET', '/Subaccount/', parameters), PlivoSubAccountFactory.class);
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

    //Conference
    // Get Details of all Live conferences
    public PlivoLiveConferenceFactory getLiveConferences() {
        return (PlivoLiveConferenceFactory)JSON.deserialize(request('GET', '/Conference/', new Map<String, String>()), PlivoLiveConferenceFactory.class);
    }
    
    // Hangup all conferences
    public PlivoGenericResponse hangupAllConferences() {
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', '/Conference/', new Map<String, String>()), PlivoGenericResponse.class);
    }
    
    // get Details of a single Live conference
    public PlivoConference getLiveConference(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String resource_placeHolder = '/Conference/{0}/';
        List<String> resource_fillers = new String[]{conference_name};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoConference)JSON.deserialize(request('GET', resource, new Map<String, String>()), PlivoConference.class);
    }
    
    // Hangup a conference
    public PlivoGenericResponse hangupConference(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String resource_placeHolder = '/Conference/{0}/';
        List<String> resource_fillers = new String[]{conference_name};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }
    
    // Hangup a member in a conference
    public PlivoGenericResponse hangupMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }
    
    // Play music to a member in a conference
    public PlivoGenericResponse playMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Play/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }
    
    // Stop playing music to a member in a conference
    public PlivoGenericResponse stopPlayMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Play/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Play a message to a Member in a conference
    public PlivoGenericResponse speakMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Speak/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        String text = parameters.get('text');
        parameters.put('text', text);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Stop playing message to a member in a conference
    public PlivoGenericResponse stopSpeakMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Speak/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Deaf a Member in a conference
    public PlivoGenericResponse deafMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Deaf/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }
    
    // Undeaf a Member in a conference
    public PlivoGenericResponse undeafMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Deaf/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }
    
    // Mute a member in a conference
    public PlivoGenericResponse muteMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Mute/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Unmute a Member in a conference
    public PlivoGenericResponse unmuteMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Mute/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }

    // Kick a Member out of a conference
    public PlivoGenericResponse kickMember(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String member_id = parameters.get('member_id');
        String resource_placeHolder = '/Conference/{0}/Member/{1}/Kick/';
        List<String> resource_fillers = new String[]{conference_name,member_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, new Map<String, String>()), PlivoGenericResponse.class);
    }
    
    // Start recording a conference
    public PlivoRecord recordConference(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String resource_placeHolder = '/Conference/{0}/Record/';
        List<String> resource_fillers = new String[]{conference_name};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoRecord)JSON.deserialize(request('POST', resource, parameters), PlivoRecord.class);
    }
    
    // Stop Recording a conference
    public PlivoGenericResponse stopRecordConference(Map<String, String> parameters) {
        String conference_name = parameters.get('conference_name');
        String resource_placeHolder = '/Conference/{0}/Record/';
        List<String> resource_fillers = new String[]{conference_name};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, new Map<String, String>()),PlivoGenericResponse.class);
    }    

    // Endpoint
    // Get Details of all Endpoints
    public PlivoEndpointFactory getEndpoints(Map<String, String> parameters) {
        return (PlivoEndpointFactory)JSON.deserialize(request('GET', '/Endpoint/', parameters), PlivoEndpointFactory.class);
    }

    // Create a new Endpoint
    public PlivoEndpoint createEndpoint(Map<String, String> parameters) {
        return (PlivoEndpoint)JSON.deserialize(request('POST', '/Endpoint/', parameters), PlivoEndpoint.class);
    }
    
    // Get details of a single endpoint
    public PlivoEndpoint getEndpoint(Map<String, String> parameters) {
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoEndpoint)JSON.deserialize(request('GET', resource, new Map<String, String>()), PlivoEndpoint.class);
    }
    
    // Edit an Endpoint
    public PlivoGenericResponse editEndpoint(Map<String, String> parameters) {
        String endpoint_id = parameters.get('endpoint_id');
        String resource_placeHolder = '/Endpoint/{0}/';
        List<String> resource_fillers = new String[]{endpoint_id};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, parameters), PlivoGenericResponse.class);
    }
    
    // Delete an Endpoint
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

    // Number
    // Get Details of all numbers
    public PlivoNumberSearchFactory getNumbers(Map<String, String> parameters) {
        return (PlivoNumberSearchFactory)JSON.deserialize(request('GET', '/Number/', parameters), PlivoNumberSearchFactory.class);
    }
    
    // Get Details of a sigle number
    public PlivoNumberResponse getNumber(Map<String, String> parameters) {
        String plivo_number = parameters.get('number');
        String resource_placeHolder = '/Number/{0}/';
        List<String> resource_fillers = new String[]{plivo_number};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoNumberResponse)JSON.deserialize(request('GET', resource, new Map<String, String>()), PlivoNumberResponse.class);
    }
    
    // Edit details of a single number
    public PlivoGenericResponse editNumber(Map<String, String> parameters) {
        String plivo_number = parameters.get('number');
        String resource_placeHolder = '/Number/{0}/';
        List<String> resource_fillers = new String[]{plivo_number};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, parameters), PlivoGenericResponse.class);
    }
    
    // Unrent a number
    public PlivoGenericResponse unRentNumber(Map<String, String> parameters) {
        String plivo_number = parameters.get('number');
        String resource_placeHolder = '/Number/{0}/';
        List<String> resource_fillers = new String[]{plivo_number};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('DELETE', resource, parameters), PlivoGenericResponse.class);
    }
    
    // Link an application to a number
    public PlivoGenericResponse linkApplicationNumber(Map<String, String> parameters) {
        String plivo_number = parameters.get('number');
        String resource_placeHolder = '/Number/{0}/';
        List<String> resource_fillers = new String[]{plivo_number};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, parameters), PlivoGenericResponse.class);
    }

    // Unlink an application from a number
    public PlivoGenericResponse unlinkApplicationNumber(Map<String, String> parameters) {
        String plivo_number = parameters.get('number');
        String resource_placeHolder = '/Number/{0}/';
        List<String> resource_fillers = new String[]{plivo_number};
        String resource = String.format(resource_placeHolder,resource_fillers);
        parameters.put('app_id', '');
        return (PlivoGenericResponse)JSON.deserialize(request('POST', resource, parameters), PlivoGenericResponse.class);
    }
    
    // Search for phone numbers
    public PlivoPhoneNumberSearchFactory searchPhoneNumber(Map<String, String> parameters) {
        return (PlivoPhoneNumberSearchFactory)JSON.deserialize(request('GET', '/PhoneNumber/', parameters), PlivoPhoneNumberSearchFactory.class);
    }
    
    // Rent a number
    public PlivoBuyNumber buyPhoneNumber(Map<String, String> parameters) {
        String plivo_number = parameters.get('number');
        String resource_placeHolder = '/PhoneNumber/{0}/';
        List<String> resource_fillers = new String[]{plivo_number};
        String resource = String.format(resource_placeHolder,resource_fillers);
        return (PlivoBuyNumber)JSON.deserialize(request('POST', resource, parameters), PlivoBuyNumber.class);
    }
    
    // Pricing
    public PlivoPricing getPricing(Map<String, String> parameters) {
        return (PlivoPricing)JSON.deserialize(request('GET', '/Pricing/', parameters), PlivoPricing.class);
    }
}