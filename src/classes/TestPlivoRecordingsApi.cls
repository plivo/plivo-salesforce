@isTest
private class TestPlivoRecordingsApi {

        @isTest static void testGetRecordingsPositive() {
            //set mock class
            PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "aa530ae1-15f7-11e6-848f-22000ae28743",' +
            '"meta": {"limit": 20,"next": null,"offset": 0,"previous": null,' +
            '"total_count": 1},"objects": [{"add_time": "2016-01-20 18:10:41.603801+05:30","call_uuid": "6f0d0f68-0311-4802-935d-2d0acd4dce21",' +
            '"conference_name": "demo","recording_duration_ms": "28600.00000","recording_end_ms": "1453293639534.00000","recording_format": "mp3",' +
            '"recording_id": "f16b799c-bf72-11e5-a16a-842b2b4be7e7","recording_start_ms": "1453293610934.00000","recording_type": "conference",' +
            '"recording_url": "https://s3.amazonaws.com/recordings_2013/f16b799c-bf72-11e5-a16a-842b2b4be7e7.mp3",' +
            '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Recording/f16b799c-bf72-11e5-a16a-842b2b4be7e7/"}]}', 200);
            Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        
        PlivoRecordingList msg = api.getRecordings(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, 'aa530ae1-15f7-11e6-848f-22000ae28743');
        System.assertEquals(msg.meta.previous, null);
        System.assertEquals(msg.meta.total_count, 1);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.limitt, 20);
        System.assertEquals(msg.meta.next, null);
        System.assertEquals(msg.objects[0].add_time, '2016-01-20 18:10:41.603801+05:30');
        System.assertEquals(msg.objects[0].call_uuid, '6f0d0f68-0311-4802-935d-2d0acd4dce21');
        System.assertEquals(msg.objects[0].conference_name, 'demo');
        System.assertEquals(msg.objects[0].recording_duration_ms, '28600.00000');
        System.assertEquals(msg.objects[0].recording_end_ms, '1453293639534.00000');
        System.assertEquals(msg.objects[0].recording_format, 'mp3');
        System.assertEquals(msg.objects[0].recording_id, 'f16b799c-bf72-11e5-a16a-842b2b4be7e7');
        System.assertEquals(msg.objects[0].recording_start_ms, '1453293610934.00000');
        System.assertEquals(msg.objects[0].recording_type, 'conference');
        System.assertEquals(msg.objects[0].recording_url, 'https://s3.amazonaws.com/recordings_2013/f16b799c-bf72-11e5-a16a-842b2b4be7e7.mp3');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Recording/f16b799c-bf72-11e5-a16a-842b2b4be7e7/');
        System.assertEquals(msg.server_code, 200);
        }
        
        @isTest static void testGetRecordingPositive() {
            //set mock class
            PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"add_time": "2016-01-20 18:10:41.603801+05:30",' +
            '"api_id": "942ca212-15f8-11e6-91a3-22000af986c2","call_uuid": "6f0d0f68-0311-4802-935d-2d0acd4dce21",' +
            '"conference_name": "demo","recording_duration_ms": "28600.00000","recording_end_ms": "1453293639534.00000","recording_format": "mp3",' +
            '"recording_id": "f16b799c-bf72-11e5-a16a-842b2b4be7e7","recording_start_ms": "1453293610934.00000","recording_type": "conference",' +
            '"recording_url": "https://s3.amazonaws.com/recordings_2013/f16b799c-bf72-11e5-a16a-842b2b4be7e7.mp3",' +
            '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Recording/f16b799c-bf72-11e5-a16a-842b2b4be7e7/"}', 200);
            Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('recording_id','f16b799c-bf72-11e5-a16a-842b2b4be7e7');
        
        PlivoRecording msg = api.getRecording(params);
        System.debug(msg);
        System.assertEquals(msg.add_time, '2016-01-20 18:10:41.603801+05:30');
        System.assertEquals(msg.api_id, '942ca212-15f8-11e6-91a3-22000af986c2');
        System.assertEquals(msg.call_uuid, '6f0d0f68-0311-4802-935d-2d0acd4dce21');
        System.assertEquals(msg.conference_name, 'demo');
        System.assertEquals(msg.recording_duration_ms, '28600.00000');
        System.assertEquals(msg.recording_end_ms, '1453293639534.00000');
        System.assertEquals(msg.recording_format, 'mp3');
        System.assertEquals(msg.recording_id, 'f16b799c-bf72-11e5-a16a-842b2b4be7e7');
        System.assertEquals(msg.recording_start_ms, '1453293610934.00000');
        System.assertEquals(msg.recording_type, 'conference');
        System.assertEquals(msg.recording_url, 'https://s3.amazonaws.com/recordings_2013/f16b799c-bf72-11e5-a16a-842b2b4be7e7.mp3');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Recording/f16b799c-bf72-11e5-a16a-842b2b4be7e7/');
        System.assertEquals(msg.server_code, 200);
        }
        
        @isTest static void testDeleteRecordingPositive() {
            //set mock class
            PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
            Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('recording_id','f16b799c-bf72-11e5-a16a-842b2b4be7e7');
        
        PlivoGenericResponse msg = api.deleteRecording(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
        }

}