@isTest
private class TestPlivoRedirectXML {

    @isTest static void testRedirectPositive() {
        PlivoResponse response = new PlivoResponse();
        PlivoredirectXML redirect = new PlivoredirectXML('http://foo.com/redirect/');
        redirect.setMethod('GET');
        response.append(redirect);
        System.debug(response.toXML());
        
        System.assertEquals(response.toXML(), '<Response><Redirect method="GET">http://foo.com/redirect/</Redirect></Response>');
        System.assertEquals(redirect.getTag(), 'Redirect');
        System.assertEquals(redirect.getBody(), 'http://foo.com/redirect/');
        System.assertEquals(redirect.getAttributes().containsKey('method'), true);
    }

}