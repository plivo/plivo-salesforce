@isTest
private class TestPlivoDialUserXML {

	@isTest static void testDialUserXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoDialXML dial = new PlivoDialXML();
        PlivoDialUserXML user = new PlivoDialUserXML('sip:john1234@phone.plivo.com');
        user.setSendDigits('1234');
        user.setSendOnPreanswer(false);
        user.setSipHeaders('head1=val1,head2=val2');
        dial.append(user);
        response.append(dial);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Dial><User sendDigits="1234" sendOnPreanswer="false" sipHeaders="head1=val1,head2=val2">sip:john1234@phone.plivo.com</User></Dial></Response>');
        System.assertEquals(dial.getTag(), 'Dial');
        System.assertEquals(user.getTag(), 'User');
        System.assertEquals(user.getBody(), 'sip:john1234@phone.plivo.com');
        System.assertEquals(user.getAttributes().containsKey('sendDigits'), true);
        System.assertEquals(user.getAttributes().containsKey('sendOnPreanswer'), true);
        System.assertEquals(user.getAttributes().containsKey('sipHeaders'), true);
	}

}