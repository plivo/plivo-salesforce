@isTest
private class TestPlivoHangupXML {

	@isTest static void testhangupXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoHangupXML hangup = new PlivoHangupXML();
        hangup.setReason('rejected');
        hangup.setSchedule(60);
        response.append(hangup);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Hangup reason="rejected" schedule="60"/></Response>');
        System.assertEquals(hangup.getTag(), 'Hangup');
        System.assertEquals(hangup.getBody(), null);
        System.assertEquals(hangup.getAttributes().containsKey('schedule'), true);
        System.assertEquals(hangup.getAttributes().containsKey('reason'), true);
	}

}