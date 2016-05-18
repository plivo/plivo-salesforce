@isTest
private class TestPlivoPricingApi {

	@isTest static void testGetPricingPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "442149f3-18fb-11e6-b41d-22000abe9618","country": "Cyprus","country_code": 357,' +
	    '"country_iso": "CY","message": {"inbound": {"rate": null},"outbound": {"rate": "0.01180"},"outbound_networks_list": [{"group_name": "Cyprus-Others","rate": "0.02000"}' +
	    ',{"group_name": "CYTAmobile-Vodafone","rate": "0.01180"},{"group_name": "Lemontel Ltd","rate": "0.02000"},{"group_name": "MTN (Areeba Ltd)","rate": "0.01180"},' +
	    '{"group_name": "PrimeTel PLC","rate": "0.01180"}]},"phone_numbers": {"local": {"rate": "4.50000"},"tollfree": {"rate": null}},"voice": {"inbound": {"ip": {"rate": "0.00300"}' +
	    ',"local": {"rate": "0.00500"},"tollfree": {"rate": null}},"outbound": {"ip": {"rate": "0.00300"},"local": {"rate": "0.01340"},' +
	    '"rates": [{"prefix": ["357"],"rate": "0.01340"},{"prefix": ["35797","35799"],"rate": "0.04270"},{"prefix": ["357942","35796"],"rate": "0.05030"},' +
	    '{"prefix": ["35795"],"rate": "0.08180"},{"prefix": ["357700","3577777"],"rate": "0.12360"}],"tollfree": {"rate": null}}}}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('country_iso','CY');
        
        PlivoPricing msg = api.getPricing(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '442149f3-18fb-11e6-b41d-22000abe9618');
        System.assertEquals(msg.country, 'Cyprus');
        System.assertEquals(msg.country_code, '357');
        System.assertEquals(msg.country_iso, 'CY');
        System.assertEquals(msg.message.inbound.rate, null);
        System.assertEquals(msg.message.outbound.rate, '0.01180');
        System.assertEquals(msg.phone_numbers.local.rate, '4.50000');
        System.assertEquals(msg.phone_numbers.tollfree.rate, null);
        System.assertEquals(msg.voice.inbound.ip.rate, '0.00300');
        System.assertEquals(msg.voice.inbound.local.rate, '0.00500');
        System.assertEquals(msg.voice.inbound.tollfree.rate, null);
        System.assertEquals(msg.voice.outbound.ip.rate, '0.00300');
        System.assertEquals(msg.voice.outbound.local.rate, '0.01340');
        System.assertEquals(msg.voice.outbound.tollfree.rate, null);
        System.assertEquals(msg.voice.outbound.rates[0].prefix[0], '357');
        System.assertEquals(msg.voice.outbound.rates[0].rate, '0.01340');
        System.assertEquals(msg.voice.outbound.rates[1].prefix[0], '35797');
        System.assertEquals(msg.voice.outbound.rates[1].prefix[1], '35799');
        System.assertEquals(msg.voice.outbound.rates[1].rate, '0.04270');
        System.assertEquals(msg.voice.outbound.rates[2].prefix[0], '357942');
        System.assertEquals(msg.voice.outbound.rates[2].prefix[1], '35796');
        System.assertEquals(msg.voice.outbound.rates[2].rate, '0.05030');
        System.assertEquals(msg.voice.outbound.rates[3].prefix[0], '35795');
        System.assertEquals(msg.voice.outbound.rates[3].rate, '0.08180');
        System.assertEquals(msg.voice.outbound.rates[4].prefix[0], '357700');
        System.assertEquals(msg.voice.outbound.rates[4].prefix[1], '3577777');
        System.assertEquals(msg.voice.outbound.rates[4].rate, '0.12360');
        System.assertEquals(msg.server_code, 200);
	}

}