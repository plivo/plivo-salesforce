@isTest
private class TestPlivoAccountApi {

	@isTest static void testGetAccountPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"account_type": "standard","address": "123 Main St."' +
	    ',"api_id": "0760deee-8a6e-11e4-a2d1-22000ac5040c","auth_id": "MAYMFHYZJKMJG0NJG3AG","auto_recharge": false,' +
	    '"billing_mode": "prepaid","cash_credits": "188.18557","city": "San Francisco","name": "John Smith",' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/","state": "California","timezone": "America/Los_Angeles"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        PlivoAccount msg = api.getAccount();
        System.debug(msg);
        System.assertEquals(msg.account_type, 'standard');
        System.assertEquals(msg.address, '123 Main St.');
        System.assertEquals(msg.api_id, '0760deee-8a6e-11e4-a2d1-22000ac5040c');
        System.assertEquals(msg.auth_id, 'MAYMFHYZJKMJG0NJG3AG');
        System.assertEquals(msg.auto_recharge, false);
        System.assertEquals(msg.billing_mode, 'prepaid');
        System.assertEquals(msg.cash_credits, '188.18557');
        System.assertEquals(msg.city, 'San Francisco');
        System.assertEquals(msg.name, 'John Smith');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/');
        System.assertEquals(msg.state, 'California');
        System.assertEquals(msg.timezone, 'America/Los_Angeles');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testEditAccountPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "2a9279e2-8267-11e5-a62c-22000afb0fc5","message": "changed"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('name','Smith John');
        params.put('city','Brooklyn');
        
        PlivoGenericResponse msg = api.editAccount(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '2a9279e2-8267-11e5-a62c-22000afb0fc5');
        System.assertEquals(msg.message, 'changed');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testGetSubaccountsPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "89354925-8268-11e5-a62c-22000afb0fc5",' + 
	    '"meta": {"limit": 20,"next": null,"offset": 0,"previous": null,"total_count": 2},"objects": ' + 
	    '[{"account": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/","auth_id": "SAZELIZJJIODFLNJK3NZ","auth_token": "MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3",' +
	    '"created": "2015-11-03","enabled": true,"modified": null,"name": "test_subaccount1","new_auth_token": "MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3",' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Subaccount/SAZELIZJJIODFLNJK3NZ/"},{"account": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/",' +
	    '"auth_id": "SANZDINZKZY6QWODLHBV","auth_token": "NmEyNGJhY2I1MzkwNDdkZTYwNmQxMGRkYTc8YWVm","created": "2015-10-01","enabled": true,' +
	    '"modified": null,"name": "testing","new_auth_token": "NmEyNGJhY2I1MzkwNDdkZTYwNmQxMGRkYTc8YWVm",' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Subaccount/SANZDINZKZY6QWODLHBV/"}]}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');

        Map<String, String> params = new Map<String, String> ();
        
        PlivoSubAccountFactory msg = api.getSubaccounts(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '89354925-8268-11e5-a62c-22000afb0fc5');
        System.assertEquals(msg.meta.limitt, 20);
        System.assertEquals(msg.meta.next, null);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.previous, null);
        System.assertEquals(msg.meta.total_count, 2);
        System.assertEquals(msg.objects[0].account, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/');
        System.assertEquals(msg.objects[0].auth_id, 'SAZELIZJJIODFLNJK3NZ');
        System.assertEquals(msg.objects[0].auth_token, 'MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3');
        System.assertEquals(msg.objects[0].created, '2015-11-03');
        System.assertEquals(msg.objects[0].enabled, true);
        System.assertEquals(msg.objects[0].modified, null);
        System.assertEquals(msg.objects[0].name, 'test_subaccount1');
        System.assertEquals(msg.objects[0].new_auth_token, 'MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Subaccount/SAZELIZJJIODFLNJK3NZ/');
        System.assertEquals(msg.objects[1].account, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/');
        System.assertEquals(msg.objects[1].auth_id, 'SANZDINZKZY6QWODLHBV');
        System.assertEquals(msg.objects[1].auth_token, 'NmEyNGJhY2I1MzkwNDdkZTYwNmQxMGRkYTc8YWVm');
        System.assertEquals(msg.objects[1].created, '2015-10-01');
        System.assertEquals(msg.objects[1].enabled, true);
        System.assertEquals(msg.objects[1].modified, null);
        System.assertEquals(msg.objects[1].name, 'testing');
        System.assertEquals(msg.objects[1].new_auth_token, 'NmEyNGJhY2I1MzkwNDdkZTYwNmQxMGRkYTc8YWVm');
        System.assertEquals(msg.objects[1].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Subaccount/SANZDINZKZY6QWODLHBV/');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testGetSubaccountPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"account": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/",' +
	    '"api_id": "f2ce3f25-8267-11e5-884b-22000afc235b","auth_id": "SAZELIZJJIODFLNJK3NZ","auth_token": "MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3",' +
	    '"created": "2015-11-03","enabled": true,"modified": null,"name": "test_subaccount1","new_auth_token": "MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3",' +
	    '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Subaccount/SAZELIZJJIODFLNJK3NZ/"}', 200);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('subauth_id','SAZELIZJJIODFLNJK3NZ');
        
        PlivoSubAccount msg = api.getSubaccount(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, 'f2ce3f25-8267-11e5-884b-22000afc235b');
        System.assertEquals(msg.account, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/');
        System.assertEquals(msg.auth_id, 'SAZELIZJJIODFLNJK3NZ');
        System.assertEquals(msg.auth_token, 'MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3');
        System.assertEquals(msg.created, '2015-11-03');
        System.assertEquals(msg.enabled, true);
        System.assertEquals(msg.modified, null);
        System.assertEquals(msg.name, 'test_subaccount1');
        System.assertEquals(msg.new_auth_token, 'MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Subaccount/SAZELIZJJIODFLNJK3NZ/');
        System.assertEquals(msg.server_code, 200);
	}
	
	@isTest static void testCreateSubaccountPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "59d7a8fd-8266-11e5-a62c-22000afb0fc5",' + 
	    '"auth_id": "SAZELIZJJIODFLNJK3NZ","auth_token": "MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3","message": "created"}', 201);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('name','test_subaccount1');
        params.put('enabled','True');
        
        PlivoSubAccount msg = api.createSubaccount(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '59d7a8fd-8266-11e5-a62c-22000afb0fc5');
        System.assertEquals(msg.auth_id, 'SAZELIZJJIODFLNJK3NZ');
        System.assertEquals(msg.auth_token, 'MGRlMjFlMeNhNDUzYTRjMyNhMmZmZTYwNDA4ZjM3');
        System.assertEquals(msg.message, 'created');
        System.assertEquals(msg.server_code, 201);
	}
	
	@isTest static void testEditSubaccountPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "94a402fc-8a70-11e4-b423-22000ac8a2f8","message": "changed"}', 202);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('subauth_id','SAZELIZJJIODFLNJK3NZ');
        params.put('name','ABC_test');
        
        PlivoGenericResponse msg = api.editSubaccount(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '94a402fc-8a70-11e4-b423-22000ac8a2f8');
        System.assertEquals(msg.message, 'changed');
        System.assertEquals(msg.server_code, 202);
	}
	
	@isTest static void testDeleteSubaccountPositive() {
	    //set mock class
	    PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
	    Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('subauth_id','SAZELIZJJIODFLNJK3NZ');
        
        PlivoGenericResponse msg = api.deleteSubaccount(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
	}
}