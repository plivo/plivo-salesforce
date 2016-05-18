@isTest
private class TestPlivoConferenceApi {

  @isTest static void testGetLiveConferencesPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "2867b6e2-58c3-11e1-86da-adf28403fe48","conferences": ["My Conf Room"]}', 200);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        PlivoLiveConferenceFactory msg = api.getLiveConferences();
        System.debug(msg);
        System.assertEquals(msg.api_id, '2867b6e2-58c3-11e1-86da-adf28403fe48');
        System.assertEquals(msg.conferences[0], 'My Conf Room');
        System.assertEquals(msg.server_code, 200);
  }
  
  @isTest static void testGetLiveConferencePositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"conference_name": "My Conf Room",' +
      '"conference_run_time": "590","conference_member_count": "1","members": [{"muted": false,"member_id": "10",' +
      '"deaf": false,"from": "1456789903","to": "1677889900","caller_name": "John","direction": "inbound",' +
      '"call_uuid": "acfbf0b5-12e0-4d74-85f7-fce15f8f07ec","join_time": "590"}],"api_id": "816e903e-58c4-11e1-86da-adf28403fe48"}', 200);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        
        PlivoConference msg = api.getLiveConference(params);
        System.debug(msg);
        System.assertEquals(msg.conference_name, 'My Conf Room');
        System.assertEquals(msg.conference_run_time, '590');
        System.assertEquals(msg.conference_member_count, '1');
        System.assertEquals(msg.members[0].muted, false);
        System.assertEquals(msg.members[0].member_id, '10');
        System.assertEquals(msg.members[0].deaf, false);
        System.assertEquals(msg.members[0].from_number, '1456789903');
        System.assertEquals(msg.members[0].to, '1677889900');
        System.assertEquals(msg.members[0].caller_name, 'John');
        System.assertEquals(msg.members[0].direction, 'inbound');
        System.assertEquals(msg.members[0].call_uuid, 'acfbf0b5-12e0-4d74-85f7-fce15f8f07ec');
        System.assertEquals(msg.members[0].join_time, '590');
        System.assertEquals(msg.api_id, '816e903e-58c4-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 200);
  }
  
  @isTest static void testHangupAllConferencesPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        PlivoGenericResponse msg = api.hangupAllConferences();
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testHangupSingleConferencePositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        
        PlivoGenericResponse msg = api.hangupConference(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testHangupMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "hangup","member_id": "10","api_id": "2867b6e2-58c3-11e1-86da-adf28403fe48"}', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.hangupMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'hangup');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '2867b6e2-58c3-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testPlayMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "play done","member_id": "10",' +
      '"url": "https://s3.amazonaws.com/plivocloud/Trumpet.mp3","conference_name": "myroom","api_id": "2867b6e2-58c3-11e1-86da-adf28403fe48"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        params.put('url','https://s3.amazonaws.com/plivocloud/Trumpet.mp3');
        
        PlivoGenericResponse msg = api.playMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'play done');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '2867b6e2-58c3-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 202);
  }

    @isTest static void testStopPlayMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "playing in conference stopped",' +
      '"member_id": "10","api_id": "2867b6e2-58c3-11e1-86da-adf28403fe48"}', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.stopPlayMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'playing in conference stopped');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '2867b6e2-58c3-11e1-86da-adf28403fe48');
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testSpeakMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "speaking done","member_id": "10",' +
      '"voice": "WOMAN","language": "en-US","conference_name": "myroom","api_id": "13a53ff6-1686-11e6-b6ba-3e1d05defe78"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        params.put('text','Testing Speak API Conference');
        
        PlivoGenericResponse msg = api.speakMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'speaking done');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '13a53ff6-1686-11e6-b6ba-3e1d05defe78');
        System.assertEquals(msg.server_code, 202);
  }

    @isTest static void testStopSpeakMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "speak stopped","member_id": "10","api_id": "f2ffc12c-1685-11e6-b6ba-3e1d05defe78"}', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.stopSpeakMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'speak stopped');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, 'f2ffc12c-1685-11e6-b6ba-3e1d05defe78');
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testDeafMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "deaf","member_id": "10","api_id": "4f0ee934-168b-11e6-b6ba-3e1d05defe78"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.deafMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'deaf');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '4f0ee934-168b-11e6-b6ba-3e1d05defe78');
        System.assertEquals(msg.server_code, 202);
  }

    @isTest static void testUndeafMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.undeafMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testMuteMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "muted","member_id": "10","api_id": "83b20004-168b-11e6-b6ba-3e1d05defe78"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.muteMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'muted');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '83b20004-168b-11e6-b6ba-3e1d05defe78');
        System.assertEquals(msg.server_code, 202);
  }

    @isTest static void testUnmuteMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.unmuteMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testKickMemberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"message": "kicked","member_id": "10","api_id": "94eb6680-168b-11e6-b6ba-3e1d05defe78"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        params.put('member_id','10');
        
        PlivoGenericResponse msg = api.kickMember(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'kicked');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, '94eb6680-168b-11e6-b6ba-3e1d05defe78');
        System.assertEquals(msg.server_code, 202);
  }
  
  @isTest static void testRecordConferencePositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "21b994d2-16a1-11e6-b6ba-3e1d05defe78",' +
      '"message": "conference recording started","recording_id": "93bc7c6a-3b2b-11e3","url": "http://s3.amazonaws.com/recordings_2013/93bc7c6a-3b2b-11e3.mp3"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        
        PlivoRecord msg = api.recordConference(params);
        System.debug(msg);
        System.assertEquals(msg.url, 'http://s3.amazonaws.com/recordings_2013/93bc7c6a-3b2b-11e3.mp3');
        System.assertEquals(msg.message, 'conference recording started');
        System.assertEquals(msg.recording_id, '93bc7c6a-3b2b-11e3');
        System.assertEquals(msg.api_id, '21b994d2-16a1-11e6-b6ba-3e1d05defe78');
        System.assertEquals(msg.server_code, 202);
  }
  
  @isTest static void testStopRecordConferencePositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('conference_name','My Conf Room');
        
        PlivoGenericResponse msg = api.stopRecordConference(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
  }

}