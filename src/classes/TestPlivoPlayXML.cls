@isTest
private class TestPlivoPlayXML {

    @isTest static void testPlayXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoPlayXML play = new PlivoPlayXML('https://s3.amazonaws.com/plivocloud/Trumpet.mp3');
        play.setLoop(3);
        response.append(play);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Play loop="3">https://s3.amazonaws.com/plivocloud/Trumpet.mp3</Play></Response>');
        System.assertEquals(play.getTag(), 'Play');
        System.assertEquals(play.getBody(), 'https://s3.amazonaws.com/plivocloud/Trumpet.mp3');
        System.assertEquals(play.getAttributes().containsKey('loop'), true);
    }

}