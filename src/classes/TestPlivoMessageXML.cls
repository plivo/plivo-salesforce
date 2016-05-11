@isTest
private class TestPlivoMessageXML {

    @isTest static void testMessageXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoMessageXML message = new PlivoMessageXML('Hi, Message from Plivo');
        message.setSource('12023222222');
        message.setDestination('15671234567');
        message.setType('sms');
        message.setCallbackUrl('http://foo.com/sms_status/');
        message.setCallbackMethod('POST');
        
        response.append(message);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Message src="12023222222" dst="15671234567" type="sms" callbackUrl="http://foo.com/sms_status/" callbackMethod="POST">Hi, Message from Plivo</Message></Response>');
        System.assertEquals(message.getTag(), 'Message');
        System.assertEquals(message.getBody(), 'Hi, Message from Plivo');
        System.assertEquals(message.getAttributes().containsKey('src'), true);
        System.assertEquals(message.getAttributes().containsKey('dst'), true);
        System.assertEquals(message.getAttributes().containsKey('type'), true);
        System.assertEquals(message.getAttributes().containsKey('callbackUrl'), true);
        System.assertEquals(message.getAttributes().containsKey('callbackMethod'), true);
    }

}