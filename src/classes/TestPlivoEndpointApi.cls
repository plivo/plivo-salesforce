@isTest
private class TestPlivoEndpointApi {
	
	@isTest static void testGetEndpointsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "e12eb410-15d1-11e6-844f-22000ae28743",' +
	    '"meta": {"limit": 20,"next": null,"offset": 0,"previous": null,"total_count": 2},"objects": [{"alias": "plivo_test",' +
	    '"application": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/27082215185108636/","endpoint_id": "23479881865151",' +
	    '"password": "8bc0002a467b8276aaaf47e92bc46b9f","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Endpoint/23479881865151/",' +
	    '"sip_registered": "false","sip_uri": "sip:plivo_test150528111421@phone.plivo.com","sub_account": null,"username": "plivo_test150528111421"},' +
	    '{"alias": "plivo","application": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/379619814477342321/",' +
	    '"endpoint_id": "37371860103666","password": "e3b516ea2a0d889a177bfa63003c5bca",' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Endpoint/37371860103666/","sip_registered": "false",' +
	    '"sip_uri": "sip:plivo131031145958@phone.plivo.com","sub_account": null,"username": "plivo131031145958"}]}', 200);
	    
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        
        PlivoEndpointFactory msg = api.getEndpoints(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, 'e12eb410-15d1-11e6-844f-22000ae28743');
        System.assertEquals(msg.meta.previous, null);
        System.assertEquals(msg.meta.total_count, 2);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.limitt, 20);
        System.assertEquals(msg.meta.next, null);
        
        System.assertEquals(msg.objects[0].alias, 'plivo_test');
        System.assertEquals(msg.objects[0].application, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/27082215185108636/');
        System.assertEquals(msg.objects[0].endpoint_id, '23479881865151');
        System.assertEquals(msg.objects[0].password, '8bc0002a467b8276aaaf47e92bc46b9f');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Endpoint/23479881865151/');
        System.assertEquals(msg.objects[0].sip_registered, 'false');
        System.assertEquals(msg.objects[0].sip_uri, 'sip:plivo_test150528111421@phone.plivo.com');
        System.assertEquals(msg.objects[0].sub_account, null);
        System.assertEquals(msg.objects[0].username, 'plivo_test150528111421');
        
        System.assertEquals(msg.objects[1].alias, 'plivo');
        System.assertEquals(msg.objects[1].application, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/379619814477342321/');
        System.assertEquals(msg.objects[1].endpoint_id, '37371860103666');
        System.assertEquals(msg.objects[1].password, 'e3b516ea2a0d889a177bfa63003c5bca');
        System.assertEquals(msg.objects[1].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Endpoint/37371860103666/');
        System.assertEquals(msg.objects[1].sip_registered, 'false');
        System.assertEquals(msg.objects[1].sip_uri, 'sip:plivo131031145958@phone.plivo.com');
        System.assertEquals(msg.objects[1].sub_account, null);
        System.assertEquals(msg.objects[1].username, 'plivo131031145958');
        
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testGetEndpointPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"alias": "plivo","api_id": "39015de8-4fb3-11e4-a2d1-22000ac5040c",' +
	    '"application": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/379619814477342321/","endpoint_id": "37371860103666",' +
	    '"password": "e3b516ea2a0d889a177bfa63003c5bca","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Endpoint/37371860103666/",' +
	    '"sip_registered": "false","sip_uri": "sip:plivo141009125224@phone.plivo.com","sub_account": null,"username": "plivo141009125224"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('endpoint_id','37371860103666');
        
        PlivoEndpoint msg = api.getEndpoint(params);
        System.debug(msg);
        System.assertEquals(msg.alias, 'plivo');
        System.assertEquals(msg.api_id, '39015de8-4fb3-11e4-a2d1-22000ac5040c');
        System.assertEquals(msg.application, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/379619814477342321/');
        System.assertEquals(msg.endpoint_id, '37371860103666');
        System.assertEquals(msg.password, 'e3b516ea2a0d889a177bfa63003c5bca');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Endpoint/37371860103666/');
        System.assertEquals(msg.sip_registered, 'false');
        System.assertEquals(msg.sip_uri, 'sip:plivo141009125224@phone.plivo.com');
        System.assertEquals(msg.sub_account, null);
        System.assertEquals(msg.username, 'plivo141009125224');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testCreateEndpointPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"username": "plivo131031145958","alias": "plivo","message": "created",' +
	    '"endpoint_id": "37371860103666","api_id": "1c13de4c-423d-11e3-9899-22000abfa5d5"}', 201);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('username','plivo');
        params.put('password','plivo');
        params.put('alias','plivo');
        
        PlivoEndpoint msg = api.createEndpoint(params);
        System.debug(msg);
        System.assertEquals(msg.username, 'plivo131031145958');
        System.assertEquals(msg.alias, 'plivo');
        System.assertEquals(msg.message, 'created');
        System.assertEquals(msg.endpoint_id, '37371860103666');
        System.assertEquals(msg.api_id, '1c13de4c-423d-11e3-9899-22000abfa5d5');
        System.assertEquals(msg.server_code, 201);
	}
	
	@isTest static void testEditEndpointPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "changed","api_id": "424d84ea-8a6d-11e4-a2d1-22000ac5040c"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('endpoint_id','37371860103666');
        params.put('alias','plivo_test');
        
        PlivoGenericResponse msg = api.editEndpoint(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '424d84ea-8a6d-11e4-a2d1-22000ac5040c');
        System.assertEquals(msg.message, 'changed');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testDeleteEndpointPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('endpoint_id','37371860103666');
        
        PlivoGenericResponse msg = api.deleteEndpoint(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
}