@isTest
private class TestRestApi {
	private static testMethod void test() {
	    Test.setMock(HttpCalloutMock.class, new YourHttpCalloutMockImpl());

	    
        String auth_Id = '';
        String auth_Token = '';
    
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        System.debug('created constructor');
        Map<String, String> params = new Map<String, String> ();
        params.put('src','18583650866');
        params.put('dst','12109206499');
        params.put('text','Testing');
        System.debug(params);
        System.debug('checking params');
        Boolean containsrc = params.containsKey('src');
        System.assertEquals(true, containsrc);
        
        Boolean containdst = params.containsKey('dst');
        System.assertEquals(true, containdst);
        
        Boolean containtext = params.containsKey('text');
        System.assertEquals(true, containtext);
        System.debug('Sending message now');
        MessageResponse msg = api.sendMessage(params);
        System.debug(msg);
        //String status = msg.servercode;
        //System.debug(status);
        System.assertEquals(202, 202);
	}
}