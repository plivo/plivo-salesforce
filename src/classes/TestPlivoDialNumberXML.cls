@isTest
private class TestPlivoDialNumberXML {

	@isTest static void testDialNumberXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoDialXML dial = new PlivoDialXML();
        PlivoDialNumberXML num = new PlivoDialNumberXML('1234567890');
        num.setSendDigits('1234');
        num.setSendOnPreanswer(false);
        dial.append(num);
        response.append(dial);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Dial><Number sendDigits="1234" sendOnPreanswer="false">1234567890</Number></Dial></Response>');
        System.assertEquals(dial.getTag(), 'Dial');
        System.assertEquals(num.getTag(), 'Number');
        System.assertEquals(num.getBody(), '1234567890');
        System.assertEquals(num.getAttributes().containsKey('sendDigits'), true);
        System.assertEquals(num.getAttributes().containsKey('sendOnPreanswer'), true);
	}

}