@isTest
private class TestPlivoSpeakXML {

    @isTest static void testSpeakXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoSpeakXML speak = new PlivoSpeakXML('Testing Speak XML');
        speak.setVoice('WOMAN');
        speak.setLanguage('en-GB');
        speak.setLoop(3);
        response.append(speak);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Speak voice="WOMAN" language="en-GB" loop="3">Testing Speak XML</Speak></Response>');
        System.assertEquals(speak.getTag(), 'Speak');
        System.assertEquals(speak.getBody(), 'Testing Speak XML');
        System.assertEquals(speak.getAttributes().containsKey('voice'), true);
        System.assertEquals(speak.getAttributes().containsKey('loop'), true);
        System.assertEquals(speak.getAttributes().containsKey('language'), true);
    }

}