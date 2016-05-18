@isTest
private class TestPlivoMessageApi {

	@isTest static void testSendSingleMessagePositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "message(s) queued",' +
	    '"message_uuid": ["db3ce55a-7f1d-11e1-8ea7-1231380bc196"],"api_id": "db342550-7f1d-11e1-8ea7-1231380bc196"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('src','18583650866');
        params.put('dst','12109206499');
        params.put('text','Testing');
        
        PlivoMessage msg = api.sendMessage(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'message(s) queued');
        System.assertEquals(msg.message_uuid[0], 'db3ce55a-7f1d-11e1-8ea7-1231380bc196');
        System.assertEquals(msg.api_id, 'db342550-7f1d-11e1-8ea7-1231380bc196');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testSendBulkMessagesPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "message(s) queued",'+
	    '"message_uuid": ["2d55d550-8a73-11e4-9bd8-22000afa12b9","2d5617e0-8a73-11e4-89de-22000ae885b8"],"api_id": "2d30af46-8a73-11e4-96e3-22000abcb9af"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('src','18583650866');
        params.put('dst','12109206499<12109206498');
        params.put('text','Testing Bulk');
        
        PlivoMessage msg = api.sendMessage(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'message(s) queued');
        System.assertEquals(msg.message_uuid[0], '2d55d550-8a73-11e4-9bd8-22000afa12b9');
        System.assertEquals(msg.message_uuid[1], '2d5617e0-8a73-11e4-89de-22000ae885b8');
        System.assertEquals(msg.api_id, '2d30af46-8a73-11e4-96e3-22000abcb9af');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testGetMessagePositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message_state": "delivered","total_amount": "0.02600",' +
	    '"to_number": "3333333333","total_rate": "0.00650","api_id": "ebe64d72-8a75-11e4-ac1f-22000ac51de6","message_direction": "outbound",' +
	    '"from_number": "1111111111","message_uuid": "0936ec98-7c4c-11e4-9bd8-22000afa12b9","message_time": "2014-12-05 12:27:54+05:30",' +
	    '"units": 4,"message_type": "sms","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/0936ec98-7c4c-11e4-9bd8-22000afa12b9/"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('message_uuid','0936ec98-7c4c-11e4-9bd8-22000afa12b9');
        
        PlivoMDR msg = api.getMessage(params);
        System.debug(msg);
        System.assertEquals(msg.message_state, 'delivered');
        System.assertEquals(msg.total_amount, '0.02600');
        System.assertEquals(msg.to_number, '3333333333');
        System.assertEquals(msg.total_rate, '0.00650');
        System.assertEquals(msg.api_id, 'ebe64d72-8a75-11e4-ac1f-22000ac51de6');
        System.assertEquals(msg.message_direction, 'outbound');
        System.assertEquals(msg.from_number, '1111111111');
        System.assertEquals(msg.message_uuid, '0936ec98-7c4c-11e4-9bd8-22000afa12b9');
        System.assertEquals(msg.message_time, '2014-12-05 12:27:54+05:30');
        System.assertEquals(msg.units, 4);
        System.assertEquals(msg.message_type, 'sms');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/0936ec98-7c4c-11e4-9bd8-22000afa12b9/');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testGetMessagesPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"meta": {"previous": "None","total_count":2,"offset": 0,' +
	    '"limit": 3,"next":"/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/?limit=20&offset=0"},"objects":[{"message_state":"sent","total_amount":"0.00650",' + 
	    '"to_number":"2222222222","total_rate":"0.00650","message_direction":"outbound","from_number":"1111111111",' + 
	    '"message_uuid":"1aead330-8ff9-11e4-9bd8-22000afa12b9","message_time": "2014-12-30 11:54:38+04:00","units": 1,"message_type":"sms",' + 
	    '"resource_uri":"/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/1aead330-8ff9-11e4-9bd8-22000afa12b9/"},{"message_state": "delivered",' +
	    '"total_amount": "0.00650","to_number": "1111111111","total_rate": "0.00650", "message_direction": "inbound","from_number": "2222222222",' +
	    '"message_uuid": "15fbd64e-8ff9-11e4-b1a4-22000ac693b1","message_time": "2014-12-30 11:54:30+04:00","units": 1,"message_type": "sms",' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/15fbd64e-8ff9-11e4-b1a4-22000ac693b1/"}],"api_id": "625944ba-9259-11e4-96e3-22000abcb9af"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        
        PlivoMDRFactory msg = api.getMessages(params);
        System.debug(msg);
        System.assertEquals(msg.meta.previous, 'None');
        System.assertEquals(msg.meta.total_count, 2);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.limitt, 3);
        System.assertEquals(msg.meta.next, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/?limit=20&offset=0');
        System.assertEquals(msg.objects[0].message_state, 'sent');
        System.assertEquals(msg.objects[0].total_amount, '0.00650');
        System.assertEquals(msg.objects[0].to_number, '2222222222');
        System.assertEquals(msg.objects[0].total_rate, '0.00650');
        System.assertEquals(msg.objects[0].message_direction, 'outbound');
        System.assertEquals(msg.objects[0].from_number, '1111111111');
        System.assertEquals(msg.objects[0].message_uuid, '1aead330-8ff9-11e4-9bd8-22000afa12b9');
        System.assertEquals(msg.objects[0].message_time, '2014-12-30 11:54:38+04:00');
        System.assertEquals(msg.objects[0].units, 1);
        System.assertEquals(msg.objects[0].message_type, 'sms');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/1aead330-8ff9-11e4-9bd8-22000afa12b9/');
        System.assertEquals(msg.objects[1].message_state, 'delivered');
        System.assertEquals(msg.objects[1].total_amount, '0.00650');
        System.assertEquals(msg.objects[1].to_number, '1111111111');
        System.assertEquals(msg.objects[1].total_rate, '0.00650');
        System.assertEquals(msg.objects[1].message_direction, 'inbound');
        System.assertEquals(msg.objects[1].from_number, '2222222222');
        System.assertEquals(msg.objects[1].message_uuid, '15fbd64e-8ff9-11e4-b1a4-22000ac693b1');
        System.assertEquals(msg.objects[1].message_time, '2014-12-30 11:54:30+04:00');
        System.assertEquals(msg.objects[1].units, 1);
        System.assertEquals(msg.objects[1].message_type, 'sms');
        System.assertEquals(msg.objects[1].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Message/15fbd64e-8ff9-11e4-b1a4-22000ac693b1/');
        System.assertEquals(msg.server_code, 200);
	}

}