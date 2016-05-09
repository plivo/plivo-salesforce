@isTest
private class TestPlivoCancelRequestApi {

	@isTest static void testHangupRequestPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('request_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoGenericResponse msg = api.hangupRequest(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}

}