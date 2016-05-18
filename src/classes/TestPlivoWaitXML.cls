@isTest
private class TestPlivoWaitXML {

    @isTest static void testWaitXMLUTOnePositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoWaitXML wait = new PlivoWaitXML();
        wait.setLength(10);
        wait.setSilence(true);
        wait.setMinSilence(3000);
        response.append(wait);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Wait length="10" silence="true" minSilence="3000"/></Response>');
        System.assertEquals(wait.getTag(), 'Wait');
        System.assertEquals(wait.getBody(), null);
        System.assertEquals(wait.getAttributes().containsKey('length'), true);
        System.assertEquals(wait.getAttributes().containsKey('silence'), true);
        System.assertEquals(wait.getAttributes().containsKey('minSilence'), true);
    }
	
    @isTest static void testWaitXMLUTTwoPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoWaitXML wait = new PlivoWaitXML();
        wait.setLength(100);
        wait.setBeep(true);
        response.append(wait);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Wait length="100" beep="true"/></Response>');
        System.assertEquals(wait.getTag(), 'Wait');
        System.assertEquals(wait.getBody(), null);
        System.assertEquals(wait.getAttributes().containsKey('length'), true);
        System.assertEquals(wait.getAttributes().containsKey('beep'), true);
    }

}