@isTest
private class TestPlivoDtmfXML {

	@isTest static void testDtmfXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoDtmfXML dtmf = new PlivoDtmfXML('1234');
        response.append(dtmf);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><DTMF>1234</DTMF></Response>');
        System.assertEquals(dtmf.getTag(), 'DTMF');
        System.assertEquals(dtmf.getBody(), '1234');
	}

}