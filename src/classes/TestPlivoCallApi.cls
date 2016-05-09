@isTest
private class TestPlivoCallApi {

	@isTest static void testMakeSingleCallPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "call fired",' +
	    '"request_uuid": "9834029e-58b6-11e1-b8b7-a5bd0e4e126f","api_id": "97ceeb52-58b6-11e1-86da-77300b68f8bb"}', 201);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('from','18583650866');
        params.put('to','12109206499');
        params.put('answer_url','https://example.com/answer');
        
        PlivoCall msg = api.makeCall(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'call fired');
        System.assertEquals(msg.request_uuid, '9834029e-58b6-11e1-b8b7-a5bd0e4e126f');
        System.assertEquals(msg.api_id, '97ceeb52-58b6-11e1-86da-77300b68f8bb');
        System.assertEquals(msg.server_code, 201);
	}
	
	@isTest static void testMakeBulkCallsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "call fired",' +
	    '"request_uuid": ["d7fa180c-9501-11e4-a4d0-3f7813869e0a","d7fa180c-9501-11e4-a4d0-3f7813869e1a"],"api_id": "be50302a-9502-11e4-a0ec-fd067af138be"}', 201);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('from','18583650866');
        params.put('to','12109206499<12109206498');
        params.put('answer_url','https://example.com/answer');
        
        PlivoBulkCall msg = api.makeBulkCall(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'call fired');
        System.assertEquals(msg.request_uuid[0], 'd7fa180c-9501-11e4-a4d0-3f7813869e0a');
        System.assertEquals(msg.request_uuid[1], 'd7fa180c-9501-11e4-a4d0-3f7813869e1a');
        System.assertEquals(msg.api_id, 'be50302a-9502-11e4-a0ec-fd067af138be');
        System.assertEquals(msg.server_code, 201);
	}
	
	@isTest static void testGetCDRPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"answer_time": "2015-07-26 15:45:02+05:30",' +
	    '"api_id": "06ae0f8f-dc72-11e5-b56c-22000ae90795","bill_duration": 924,"billed_duration": 960,' +
	    '"call_direction": "outbound","call_duration": 924,"call_uuid": "eba53b9e-8fbd-45c1-9444-696d2172fbc8",' +
	    '"end_time": "2015-07-26 15:45:14+05:30","from_number": "+14158572518","initiation_time": "2015-07-26 15:44:49+05:30",' +
	    '"parent_call_uuid": null,"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Call/eba53b9e-8fbd-45c1-9444-696d2172fbc8/",' +
	    '"to_number": "14153268174","total_amount": "0.13600","total_rate": "0.00850"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoCDR msg = api.getCDR(params);
        System.debug(msg);
        System.assertEquals(msg.answer_time, '2015-07-26 15:45:02+05:30');
        System.assertEquals(msg.api_id, '06ae0f8f-dc72-11e5-b56c-22000ae90795');
        System.assertEquals(msg.bill_duration, 924);
        System.assertEquals(msg.billed_duration, 960);
        System.assertEquals(msg.total_amount, '0.13600');
        System.assertEquals(msg.parent_call_uuid, null);
        System.assertEquals(msg.call_direction, 'outbound');
        System.assertEquals(msg.call_duration, 924);
        System.assertEquals(msg.to_number, '14153268174');
        System.assertEquals(msg.total_rate, '0.00850');
        System.assertEquals(msg.api_id, '06ae0f8f-dc72-11e5-b56c-22000ae90795');
        System.assertEquals(msg.from_number, '+14158572518');
        System.assertEquals(msg.end_time, '2015-07-26 15:45:14+05:30');
        System.assertEquals(msg.call_uuid, 'eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        System.assertEquals(msg.initiation_time, '2015-07-26 15:44:49+05:30');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Call/eba53b9e-8fbd-45c1-9444-696d2172fbc8/');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testGetCDRsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "8299d094-dc72-11e5-b56c-22000ae90795",' +
	    '"meta": {"limit": 20,"next": null,"offset": 0,"previous": null,"total_count": 2},' +
	    '"objects": [{"answer_time": "2015-07-26 15:45:02+05:30",' +
	    '"bill_duration": 924,"billed_duration": 960,"call_direction": "outbound","call_duration": 924,' +
	    '"call_uuid": "eba53b9e-8fbd-45c1-9444-696d2172fbc8","end_time": "2015-07-26 15:45:14+05:30","from_number": "+14158572518",' +
	    '"initiation_time": "2015-07-26 15:44:49+05:30","parent_call_uuid": null,' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Call/eba53b9e-8fbd-45c1-9444-696d2172fbc8/","to_number": "14153268174",' +
	    '"total_amount": "0.13600","total_rate": "0.00850"},{"answer_time": "2015-07-09 17:37:01+05:30",' +
	    '"bill_duration": 1,"billed_duration": 60,"call_direction": "outbound",' +
	    '"call_duration": 1,"call_uuid": "842d8e69-2f3f-4cd4-93f2-3e61443aded3","end_time": "2015-07-09 17:37:01+05:30",' +
	    '"from_number": "+1111111111","initiation_time": "2015-07-09 17:36:52+05:30","parent_call_uuid": null,' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Call/842d8e69-2f3f-4cd4-93f2-3e61443aded3/",' +
	    '"to_number": "919663589433","total_amount": "0.03570","total_rate": "0.03570"}]}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        
        PlivoCDRFactory msg = api.getCDRs(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '8299d094-dc72-11e5-b56c-22000ae90795');
        System.assertEquals(msg.meta.previous, null);
        System.assertEquals(msg.meta.total_count, 2);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.limitt, 20);
        System.assertEquals(msg.meta.next, null);
        System.assertEquals(msg.objects[0].answer_time, '2015-07-26 15:45:02+05:30');
        System.assertEquals(msg.objects[0].bill_duration, 924);
        System.assertEquals(msg.objects[0].billed_duration, 960);
        System.assertEquals(msg.objects[0].total_amount, '0.13600');
        System.assertEquals(msg.objects[0].parent_call_uuid, null);
        System.assertEquals(msg.objects[0].call_direction, 'outbound');
        System.assertEquals(msg.objects[0].call_duration, 924);
        System.assertEquals(msg.objects[0].to_number, '14153268174');
        System.assertEquals(msg.objects[0].total_rate, '0.00850');
        System.assertEquals(msg.objects[0].from_number, '+14158572518');
        System.assertEquals(msg.objects[0].end_time, '2015-07-26 15:45:14+05:30');
        System.assertEquals(msg.objects[0].call_uuid, 'eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        System.assertEquals(msg.objects[0].initiation_time, '2015-07-26 15:44:49+05:30');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Call/eba53b9e-8fbd-45c1-9444-696d2172fbc8/');
        System.assertEquals(msg.objects[1].answer_time, '2015-07-09 17:37:01+05:30');
        System.assertEquals(msg.objects[1].bill_duration, 1);
        System.assertEquals(msg.objects[1].billed_duration, 60);
        System.assertEquals(msg.objects[1].total_amount, '0.03570');
        System.assertEquals(msg.objects[1].parent_call_uuid, null);
        System.assertEquals(msg.objects[1].call_direction, 'outbound');
        System.assertEquals(msg.objects[1].call_duration, 1);
        System.assertEquals(msg.objects[1].to_number, '919663589433');
        System.assertEquals(msg.objects[1].total_rate, '0.03570');
        System.assertEquals(msg.objects[1].from_number, '+1111111111');
        System.assertEquals(msg.objects[1].end_time, '2015-07-09 17:37:01+05:30');
        System.assertEquals(msg.objects[1].call_uuid, '842d8e69-2f3f-4cd4-93f2-3e61443aded3');
        System.assertEquals(msg.objects[1].initiation_time, '2015-07-09 17:36:52+05:30');
        System.assertEquals(msg.objects[1].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Call/842d8e69-2f3f-4cd4-93f2-3e61443aded3/');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testGetLiveCallPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "74f6cdf7-15e8-11e6-b051-22000abe9618",' +
	    '"call_status": "in-progress","call_uuid": "3880e692-4b61-4ea0-bfa8-debdae9d5894","caller_name": "",' +
	    '"direction": "outbound","from": "1111111111","request_uuid": "1db88cbf-1bb1-429f-ade2-c751c5a5194a",' +
	    '"session_start": "2014-03-23 14:49:39.722551","to": "14154290945"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoLiveCall msg = api.getLiveCall(params);
        System.debug(msg);
        System.assertEquals(msg.direction, 'outbound');
        System.assertEquals(msg.from_number, '1111111111');
        System.assertEquals(msg.call_status, 'in-progress');
        System.assertEquals(msg.api_id, '74f6cdf7-15e8-11e6-b051-22000abe9618');
        System.assertEquals(msg.to, '14154290945');
        System.assertEquals(msg.caller_name, '');
        System.assertEquals(msg.request_uuid, '1db88cbf-1bb1-429f-ade2-c751c5a5194a');
        System.assertEquals(msg.call_uuid, '3880e692-4b61-4ea0-bfa8-debdae9d5894');
        System.assertEquals(msg.session_start, '2014-03-23 14:49:39.722551');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testGetLiveCallsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "c9527676-5839-11e1-86da-6ff39efcb949",' +
	    '"calls": ["eac94337-b1cd-499b-82d1-b39bca50dc31","0a70a7fb-168e-4944-a846-4f3f4d2f96f1"]}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        PlivoLiveCallFactory msg = api.getLiveCalls();
        System.debug(msg);
        System.assertEquals(msg.api_id, 'c9527676-5839-11e1-86da-6ff39efcb949');
        System.assertEquals(msg.calls[0], 'eac94337-b1cd-499b-82d1-b39bca50dc31');
        System.assertEquals(msg.calls[1], '0a70a7fb-168e-4944-a846-4f3f4d2f96f1');
        System.assertEquals(msg.server_code, 200);
	}

    @isTest static void testHangupAllCallsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        PlivoGenericResponse msg = api.hangupAllCalls();
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
	
	@isTest static void testHangupSingleCallPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoGenericResponse msg = api.hangupCall(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
	
	@isTest static void testTransferCallsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"call_uuids": ["e66aa1a0-9587-11e4-9d37-c15e0b562efe"],' +
	    '"message": "transfer executed", "api_id": "eb8c80ae-9587-11e4-b423-22000ac8a2f8"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('legs','aleg');
        params.put('aleg_url','https://example.com/transfer');
        
        PlivoTransferResponse msg = api.transferCall(params);
        System.debug(msg);
        System.assertEquals(msg.call_uuids[0], 'e66aa1a0-9587-11e4-9d37-c15e0b562efe');
        System.assertEquals(msg.message, 'transfer executed');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, 'eb8c80ae-9587-11e4-b423-22000ac8a2f8');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testRecordCallsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"url": "http://s3.amazonaws.com/recordings_2013/48dfaf60-3b2a-11e3.mp3",' +
	    '"message": "call recording started","recording_id": "48dfaf60-3b2a-11e3","api_id": "c7b69074-58be-11e1-86da-adf28403fe48"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoRecord msg = api.record(params);
        System.debug(msg);
        System.assertEquals(msg.url, 'http://s3.amazonaws.com/recordings_2013/48dfaf60-3b2a-11e3.mp3');
        System.assertEquals(msg.message, 'call recording started');
        System.assertEquals(msg.recording_id, '48dfaf60-3b2a-11e3');
        System.assertEquals(msg.api_id, 'c7b69074-58be-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testStopRecordCallsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoGenericResponse msg = api.stopRecord(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
	
	@isTest static void testPlayPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "play started","api_id": "07abfd94-58c0-11e1-86da-adf28403fe48"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        params.put('url','https://s3.amazonaws.com/plivocloud/Trumpet.mp3');
        
        PlivoGenericResponse msg = api.stopPlay(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'play started');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '07abfd94-58c0-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 202);
	}

    @isTest static void testStopPlayPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoGenericResponse msg = api.stopPlay(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
	
	@isTest static void testSpeakPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "speak started","api_id": "07abfd94-58c0-11e1-86da-adf28403fe48"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        params.put('text','Testing Speak API');
        
        PlivoGenericResponse msg = api.stopPlay(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'speak started');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '07abfd94-58c0-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testStopSpeakPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        params.put('digits','12345');
        
        PlivoGenericResponse msg = api.stopSpeak(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
	
	@isTest static void testSendDigitsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "digits sent","api_id": "07abfd94-58c0-11e1-86da-adf28403fe48"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid','eba53b9e-8fbd-45c1-9444-696d2172fbc8');
        
        PlivoGenericResponse msg = api.sendDigits(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'digits sent');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '07abfd94-58c0-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 202);
	}

}