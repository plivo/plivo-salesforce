@isTest
private class TestPlivoConferenceXML {

	@isTest static void testconferenceXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoConferenceXML conference = new PlivoConferenceXML('My Conf Room');
        conference.setMuted(false);
        conference.setStartConferenceOnEnter(true);
        conference.setEndConferenceOnExit(true);
        conference.setStayAlone(false);
        conference.setEnterSound('beep:1');
        conference.setExitSound('beep:2');
        conference.setWaitSound('http://foo.com/wait_sound/');
        conference.setMaxMembers(20);
        conference.setTimeLimit(600);
        conference.setHangupOnStar(false);
        conference.setRecord(true);
        conference.setAction('http://foo.com/action/');
        conference.setMethod('GET');
        conference.setDigitsMatch('11,12,13');
        conference.setCallbackUrl('http://foo.com/callback/');
        conference.setCallbackMethod('GET');
        conference.setFloorEvent(true);
        conference.setRedirect(false);
        conference.setRecordFileFormat('mp3');
        response.append(conference);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Conference muted="false" startConferenceOnEnter="true" endConferenceOnExit="true"' +
                            ' stayAlone="false" enterSound="beep:1" exitSound="beep:2" waitSound="http://foo.com/wait_sound/" maxMembers="20"' +
                            ' timeLimit="600" hangupOnStar="false" record="true" action="http://foo.com/action/" method="GET" digitsMatch="11,12,13"'+
                            ' callbackUrl="http://foo.com/callback/" callbackMethod="GET" floorEvent="true" redirect="false" recordFileFormat="mp3">My Conf Room</Conference></Response>');
        System.assertEquals(conference.getTag(), 'Conference');
        System.assertEquals(conference.getBody(), 'My Conf Room');
        System.assertEquals(conference.getAttributes().containsKey('muted'), true);
        System.assertEquals(conference.getAttributes().containsKey('startConferenceOnEnter'), true);
        System.assertEquals(conference.getAttributes().containsKey('endConferenceOnExit'), true);
        System.assertEquals(conference.getAttributes().containsKey('stayAlone'), true);
        System.assertEquals(conference.getAttributes().containsKey('enterSound'), true);
        System.assertEquals(conference.getAttributes().containsKey('exitSound'), true);
        System.assertEquals(conference.getAttributes().containsKey('waitSound'), true);
        System.assertEquals(conference.getAttributes().containsKey('maxMembers'), true);
        System.assertEquals(conference.getAttributes().containsKey('timeLimit'), true);
        System.assertEquals(conference.getAttributes().containsKey('hangupOnStar'), true);
        System.assertEquals(conference.getAttributes().containsKey('record'), true);
        System.assertEquals(conference.getAttributes().containsKey('action'), true);
        System.assertEquals(conference.getAttributes().containsKey('method'), true);
        System.assertEquals(conference.getAttributes().containsKey('digitsMatch'), true);
        System.assertEquals(conference.getAttributes().containsKey('callbackUrl'), true);
        System.assertEquals(conference.getAttributes().containsKey('callbackMethod'), true);
        System.assertEquals(conference.getAttributes().containsKey('floorEvent'), true);
        System.assertEquals(conference.getAttributes().containsKey('redirect'), true);
        System.assertEquals(conference.getAttributes().containsKey('recordFileFormat'), true);
        
	}
}