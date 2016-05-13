@isTest
private class TestPlivoPreAnswerXML {

    @isTest static void testPreAnswerXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoPreAnswerXML preanswer = new PlivoPreAnswerXML();
        PlivoSpeakXML speak = new PlivoSpeakXML('This call will cost you $2 a minute.');
        preanswer.append(speak);
        response.append(preanswer);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><PreAnswer><Speak>This call will cost you $2 a minute.</Speak></PreAnswer></Response>');
        System.assertEquals(preanswer.getTag(), 'PreAnswer');
        System.assertEquals(speak.getTag(), 'Speak');
        System.assertEquals(Speak.getBody(), 'This call will cost you $2 a minute.');
    }

}