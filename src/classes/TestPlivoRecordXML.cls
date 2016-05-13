@isTest
private class TestPlivoRecordXML {

    @isTest static void testRecordXMLPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoRecordXML record = new PlivoRecordXML();
        PlivoSpeakXML speak1 = new PlivoSpeakXML('Please leave a message after the beep. Press the star key when done.');
        PlivoSpeakXML speak2 = new PlivoSpeakXML('Recording not received.');
        response.append(speak1);
        record.setMaxLength(300);
        record.setAction('http://foo.com/record_action/');
        record.setTimeout(10);
        record.setMethod('POST');
        record.setFinishOnKey('#');
        record.setPlayBeep(true);
        record.setRedirect(true);
        record.setTranscriptionType('auto');
        record.setTranscriptionUrl('http://foo.com/transcription_url/');
        record.setTranscriptionMethod('GET');
        record.setCallbackUrl('http://foo.com/record_callback/');
        record.setCallbackMethod('GET');
        record.setStartOnDialAnswer(false);
        record.setRecordSession(false);
        response.append(record);
        response.append(speak2);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Speak>Please leave a message after the beep. Press the star key when done.</Speak>' +
        '<Record maxLength="300" action="http://foo.com/record_action/" timeout="10" method="POST" finishOnKey="#" playBeep="true"' +
        ' redirect="true" transcriptionType="auto" transcriptionUrl="http://foo.com/transcription_url/" transcriptionMethod="GET"' +
        ' callbackUrl="http://foo.com/record_callback/" callbackMethod="GET" startOnDialAnswer="false" recordSession="false"/><Speak>Recording not received.</Speak></Response>');
        System.assertEquals(speak1.getTag(), 'Speak');
        System.assertEquals(speak2.getTag(), 'Speak');
        System.assertEquals(speak1.getBody(), 'Please leave a message after the beep. Press the star key when done.');
        System.assertEquals(speak2.getBody(), 'Recording not received.');
        System.assertEquals(record.getTag(), 'Record');
        System.assertEquals(record.getAttributes().containsKey('maxLength'), true);
        System.assertEquals(record.getAttributes().containsKey('action'), true);
        System.assertEquals(record.getAttributes().containsKey('timeout'), true);
        System.assertEquals(record.getAttributes().containsKey('method'), true);
        System.assertEquals(record.getAttributes().containsKey('finishOnKey'), true);
        System.assertEquals(record.getAttributes().containsKey('playBeep'), true);
        System.assertEquals(record.getAttributes().containsKey('redirect'), true);
        System.assertEquals(record.getAttributes().containsKey('transcriptionType'), true);
        System.assertEquals(record.getAttributes().containsKey('transcriptionUrl'), true);
        System.assertEquals(record.getAttributes().containsKey('transcriptionMethod'), true);
        System.assertEquals(record.getAttributes().containsKey('callbackUrl'), true);
        System.assertEquals(record.getAttributes().containsKey('callbackMethod'), true);
    }

}