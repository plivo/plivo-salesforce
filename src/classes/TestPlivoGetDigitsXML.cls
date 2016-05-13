@isTest
private class TestPlivoGetDigitsXML {

	@isTest static void testGetDigitsXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoGetDigitsXML getdigits = new PlivoGetDigitsXML();
        PlivoSpeakXML speak1 = new PlivoSpeakXML('Enter your option');
        PlivoSpeakXML speak2 = new PlivoSpeakXML('Input not received. Thank you');
        
        getdigits.setAction('http://foo.com/getdigits_action/');
        getdigits.setTimeout(5);
        getdigits.setDigitTimeout(3);
        getdigits.setMethod('POST');
        getdigits.setFinishOnKey('#');
        getdigits.setNumDigits(1);
        getdigits.setRetries(2);
        getdigits.setRedirect(true);
        getdigits.setPlayBeep(true);
        getdigits.setValidDigits('1,2,3,4');
        getdigits.setInvalidDigitsSound('http://foo.com/getdigits_callback/');
        getdigits.setLog(true);
        getdigits.append(speak1);
        response.append(getdigits);
        response.append(speak2);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><GetDigits action="http://foo.com/getdigits_action/" timeout="5"' +
                            ' digitTimeout="3" method="POST" finishOnKey="#" numDigits="1" retries="2" redirect="true" playBeep="true"' +
                            ' validDigits="1,2,3,4" invalidDigitsSound="http://foo.com/getdigits_callback/" log="true">' +
                            '<Speak>Enter your option</Speak></GetDigits><Speak>Input not received. Thank you</Speak></Response>');
        System.assertEquals(speak1.getTag(), 'Speak');
        System.assertEquals(speak2.getTag(), 'Speak');
        System.assertEquals(speak1.getBody(), 'Enter your option');
        System.assertEquals(speak2.getBody(), 'Input not received. Thank you');
        System.assertEquals(getdigits.getTag(), 'GetDigits');
        System.assertEquals(getdigits.getAttributes().containsKey('action'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('timeout'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('digitTimeout'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('method'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('finishOnKey'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('numDigits'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('retries'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('redirect'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('playBeep'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('validDigits'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('invalidDigitsSound'), true);
        System.assertEquals(getdigits.getAttributes().containsKey('log'), true);
	}

}