@isTest
private class TestPlivoDialXML {

    @isTest static void testDialNumberXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoDialXML dial = new PlivoDialXML();
        PlivoDialNumberXML num = new PlivoDialNumberXML('1234567891');
        dial.setTimeLimit(300);
        dial.setTimeout(40);
        dial.setAction('http://foo.com/dial_action/');
        dial.setMethod('GET');
        dial.setCallerId('1234567890');
        dial.setConfirmSound('http://foo.com/dial_confirm_sound/');
        dial.setConfirmKey('5');
        dial.setDialMusic('http://foo.com/dial_music/');
        dial.setRedirect(false);
        dial.setCallbackUrl('http://foo.com/dial_callback/');
        dial.setCallbackMethod('GET');
        dial.setDigitsMatch('12,13,14');
        dial.setDigitsMatchBLeg('22,23,24');
        dial.setCallerName('Plivo test');
        dial.append(num);
        response.append(dial);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Dial timeLimit="300" timeout="40" action="http://foo.com/dial_action/"' +
        ' method="GET" callerId="1234567890" confirmSound="http://foo.com/dial_confirm_sound/" confirmKey="5" dialMusic="http://foo.com/dial_music/"' +
        ' redirect="false" callbackUrl="http://foo.com/dial_callback/" callbackMethod="GET" digitsMatch="12,13,14" digitsMatchBLeg="22,23,24"' +
        ' callerName="Plivo test"><Number>1234567891</Number></Dial></Response>');
        System.assertEquals(dial.getTag(), 'Dial');
        System.assertEquals(dial.getAttributes().containsKey('timeLimit'), true);
        System.assertEquals(dial.getAttributes().containsKey('timeout'), true);
        System.assertEquals(dial.getAttributes().containsKey('action'), true);
        System.assertEquals(dial.getAttributes().containsKey('method'), true);
        System.assertEquals(dial.getAttributes().containsKey('callerId'), true);
        System.assertEquals(dial.getAttributes().containsKey('confirmSound'), true);
        System.assertEquals(dial.getAttributes().containsKey('confirmKey'), true);
        System.assertEquals(dial.getAttributes().containsKey('dialMusic'), true);
        System.assertEquals(dial.getAttributes().containsKey('redirect'), true);
        System.assertEquals(dial.getAttributes().containsKey('callbackUrl'), true);
        System.assertEquals(dial.getAttributes().containsKey('callbackMethod'), true);
        System.assertEquals(dial.getAttributes().containsKey('digitsMatch'), true);
        System.assertEquals(dial.getAttributes().containsKey('digitsMatchBLeg'), true);
        System.assertEquals(dial.getAttributes().containsKey('callerName'), true);
        System.assertEquals(num.getTag(), 'Number');
        System.assertEquals(num.getBody(), '1234567891');
    }

}