@isTest
private class TestPlivoApplicationApi {
	
	@isTest static void testGetApplicationsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "e5b05b26-10c4-11e4-a2d1-22000ac5040c","meta": {"previous": "None","total_count": 2,"offset": 0,' +
	    '"limit": 2,"next": "None"},"objects": [{"fallback_method": "POST","default_app": false,"app_name": "Testing_App",' +
	    '"sub_account": "None","production_app": false,"enabled": true,"app_id": "21935628481970026","public_uri": false,' +
	    '"hangup_url": "http://example.com/hangup","sip_uri": "sip:21935628481970026@app.plivo.com","default_endpoint_app": false,' +
	    '"answer_url": "http://example.com/answer","message_url": "","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/21935628481970026/",' +
	    '"hangup_method": "POST","message_method": "POST","fallback_answer_url": "","answer_method": "POST"},{"fallback_method": "POST",' +
	    '"default_app": false,"app_name": "Conference Demo","sub_account": "None","production_app": false,"enabled": true,"app_id": "26469261154421101",' +
	    '"public_uri": false,"hangup_url": "https://morning-ocean-4669.herokuapp.com/response/conference/","sip_uri": "sip:26469261154421101@app.plivo.com",' +
	    '"default_endpoint_app": false,"answer_url": "https://morning-ocean-4669.herokuapp.com/response/conference/",' +
	    '"message_url": "https://morning-ocean-4669.herokuapp.com/message/","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/26469261154421101/",' +
	    '"hangup_method": "POST","message_method": "GET","fallback_answer_url": "","answer_method": "GET"}]}', 200);
	    
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        
        PlivoApplicationFactory msg = api.getApplications(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, 'e5b05b26-10c4-11e4-a2d1-22000ac5040c');
        System.assertEquals(msg.meta.previous, 'None');
        System.assertEquals(msg.meta.total_count, 2);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.limitt, 2);
        System.assertEquals(msg.meta.next, 'None');
        
        System.assertEquals(msg.objects[0].fallback_method, 'POST');
        System.assertEquals(msg.objects[0].default_app, false);
        System.assertEquals(msg.objects[0].app_name, 'Testing_App');
        System.assertEquals(msg.objects[0].sub_account, 'None');
        System.assertEquals(msg.objects[0].production_app, false);
        System.assertEquals(msg.objects[0].enabled, true);
        System.assertEquals(msg.objects[0].app_id, '21935628481970026');
        System.assertEquals(msg.objects[0].public_uri, false);
        System.assertEquals(msg.objects[0].hangup_url, 'http://example.com/hangup');
        System.assertEquals(msg.objects[0].sip_uri, 'sip:21935628481970026@app.plivo.com');
        System.assertEquals(msg.objects[0].default_endpoint_app, false);
        System.assertEquals(msg.objects[0].answer_url, 'http://example.com/answer');
        System.assertEquals(msg.objects[0].message_url, '');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/21935628481970026/');
        System.assertEquals(msg.objects[0].hangup_method, 'POST');
        System.assertEquals(msg.objects[0].message_method, 'POST');
        System.assertEquals(msg.objects[0].fallback_answer_url, '');
        System.assertEquals(msg.objects[0].answer_method, 'POST');
        System.assertEquals(msg.objects[1].fallback_method, 'POST');
        System.assertEquals(msg.objects[1].default_app, false);
        System.assertEquals(msg.objects[1].app_name, 'Conference Demo');
        System.assertEquals(msg.objects[1].sub_account, 'None');
        System.assertEquals(msg.objects[1].production_app, false);
        System.assertEquals(msg.objects[1].enabled, true);
        System.assertEquals(msg.objects[1].app_id, '26469261154421101');
        System.assertEquals(msg.objects[1].public_uri, false);
        System.assertEquals(msg.objects[1].hangup_url, 'https://morning-ocean-4669.herokuapp.com/response/conference/');
        System.assertEquals(msg.objects[1].sip_uri, 'sip:26469261154421101@app.plivo.com');
        System.assertEquals(msg.objects[1].default_endpoint_app, false);
        System.assertEquals(msg.objects[1].answer_url, 'https://morning-ocean-4669.herokuapp.com/response/conference/');
        System.assertEquals(msg.objects[1].message_url, 'https://morning-ocean-4669.herokuapp.com/message/');
        System.assertEquals(msg.objects[1].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/26469261154421101/');
        System.assertEquals(msg.objects[1].hangup_method, 'POST');
        System.assertEquals(msg.objects[1].message_method, 'GET');
        System.assertEquals(msg.objects[1].fallback_answer_url, '');
        System.assertEquals(msg.objects[1].answer_method, 'GET');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testGetApplicationPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"fallback_method": "POST","default_app": false,"app_name": "Conference Demo",' +
	    '"sub_account": "None","production_app": false,"enabled": true,"app_id": "26469261154421101","api_id": "e90bca98-8a69-11e4-ac1f-22000ac51de6",' +
	    '"hangup_url": "https://morning-ocean-4669.herokuapp.com/response/conference/","sip_uri": "sip:26469261154421101@app.plivo.com",' +
	    '"default_endpoint_app": false,"answer_url": "https://morning-ocean-4669.herokuapp.com/response/conference/","public_uri": false,' +
	    '"message_url": "https://morning-ocean-4669.herokuapp.com/message/","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/26469261154421101/",' +
	    '"hangup_method": "POST","message_method": "GET","fallback_answer_url": "","answer_method": "GET"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('app_id','26469261154421101');
        
        PlivoApplication msg = api.getApplication(params);
        System.debug(msg);
        System.assertEquals(msg.fallback_method, 'POST');
        System.assertEquals(msg.default_app, false);
        System.assertEquals(msg.app_name, 'Conference Demo');
        System.assertEquals(msg.sub_account, 'None');
        System.assertEquals(msg.production_app, false);
        System.assertEquals(msg.enabled, true);
        System.assertEquals(msg.app_id, '26469261154421101');
        System.assertEquals(msg.public_uri, false);
        System.assertEquals(msg.hangup_url, 'https://morning-ocean-4669.herokuapp.com/response/conference/');
        System.assertEquals(msg.sip_uri, 'sip:26469261154421101@app.plivo.com');
        System.assertEquals(msg.default_endpoint_app, false);
        System.assertEquals(msg.answer_url, 'https://morning-ocean-4669.herokuapp.com/response/conference/');
        System.assertEquals(msg.message_url, 'https://morning-ocean-4669.herokuapp.com/message/');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/26469261154421101/');
        System.assertEquals(msg.hangup_method, 'POST');
        System.assertEquals(msg.message_method, 'GET');
        System.assertEquals(msg.fallback_answer_url, '');
        System.assertEquals(msg.answer_method, 'GET');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testCreateApplicationPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "created","app_id": "21935628481970026","api_id": "a50543a6-8a64-11e4-b153-22000abcaa64"}', 201);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('answer_url','http://example.com/answer');
        params.put('app_name','Testing_App');
        
        PlivoApplication msg = api.createApplication(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, 'a50543a6-8a64-11e4-b153-22000abcaa64');
        System.assertEquals(msg.app_id, '21935628481970026');
        System.assertEquals(msg.message, 'created');
        System.assertEquals(msg.server_code, 201);
	}
	
	@isTest static void testEditApplicationPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "changed","api_id": "6d886ed4-8a6a-11e4-ac1f-22000ac51de6"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('app_id','21935628481970026');
        params.put('answer_url','http://example.com/answer/');
        
        PlivoGenericResponse msg = api.editApplication(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '6d886ed4-8a6a-11e4-ac1f-22000ac51de6');
        System.assertEquals(msg.message, 'changed');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testDeleteApplicationPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('app_id','21935628481970026');
        
        PlivoGenericResponse msg = api.deleteApplication(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
}