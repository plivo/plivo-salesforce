@isTest
private class TestPlivoNumberApi {

  @isTest static void testGetNumbersPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "fb91ea31-16a1-11e6-9c80-22000ae30c11",' +
      '"meta": {"limit": 20,"next": null,"offset": 0,"previous": null,"total_count": 2},"objects": [{"active": true,' +
      '"added_on": "2014-10-28","alias": "Testing API 3","application": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/16634980296193768/",' +
      '"carrier": "Plivo","monthly_rental_rate": "0.80000","number": "18583650866","number_type": "local","region": "California, UNITED STATES",' +
      '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Number/18583650866/","sms_enabled": true,"sms_rate": "0.00000","sub_account": null,' +
      '"type": "local","voice_enabled": true,"voice_rate": "0.00850"},{"active": true,"added_on": "2015-02-17","alias": "testing",' +
      '"application": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/16632742496743552/","carrier": "Plivo","monthly_rental_rate": "0.80000",' +
      '"number": "447441906862","number_type": "local","region": "UNITED KINGDOM","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Number/447441906862/",' +
      '"sms_enabled": true,"sms_rate": "0.00000","sub_account": null,"type": "fixed","voice_enabled": true,"voice_rate": "0.00500"}]}', 200);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        
        PlivoNumberSearchFactory msg = api.getNumbers(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, 'fb91ea31-16a1-11e6-9c80-22000ae30c11');
        System.assertEquals(msg.meta.previous, null);
        System.assertEquals(msg.meta.total_count, 2);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.limitt, 20);
        System.assertEquals(msg.meta.next, null);
        System.assertEquals(msg.objects[0].active, true);
        System.assertEquals(msg.objects[0].added_on, '2014-10-28');
        System.assertEquals(msg.objects[0].alias, 'Testing API 3');
        System.assertEquals(msg.objects[0].application, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/16634980296193768/');
        System.assertEquals(msg.objects[0].carrier, 'Plivo');
        System.assertEquals(msg.objects[0].monthly_rental_rate, '0.80000');
        System.assertEquals(msg.objects[0].plivo_number, '18583650866');
        System.assertEquals(msg.objects[0].number_type, 'local');
        System.assertEquals(msg.objects[0].region, 'California, UNITED STATES');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Number/18583650866/');
        System.assertEquals(msg.objects[0].sms_enabled, true);
        System.assertEquals(msg.objects[0].sms_rate, '0.00000');
        System.assertEquals(msg.objects[0].sub_account, null);
        System.assertEquals(msg.objects[0].type, 'local');
        System.assertEquals(msg.objects[0].voice_enabled, true);
        System.assertEquals(msg.objects[0].voice_rate, '0.00850');
        System.assertEquals(msg.objects[1].active, true);
        System.assertEquals(msg.objects[1].added_on, '2015-02-17');
        System.assertEquals(msg.objects[1].alias, 'testing');
        System.assertEquals(msg.objects[1].application, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/16632742496743552/');
        System.assertEquals(msg.objects[1].carrier, 'Plivo');
        System.assertEquals(msg.objects[1].monthly_rental_rate, '0.80000');
        System.assertEquals(msg.objects[1].plivo_number, '447441906862');
        System.assertEquals(msg.objects[1].number_type, 'local');
        System.assertEquals(msg.objects[1].region, 'UNITED KINGDOM');
        System.assertEquals(msg.objects[1].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Number/447441906862/');
        System.assertEquals(msg.objects[1].sms_enabled, true);
        System.assertEquals(msg.objects[1].sms_rate, '0.00000');
        System.assertEquals(msg.objects[1].sub_account, null);
        System.assertEquals(msg.objects[1].type, 'fixed');
        System.assertEquals(msg.objects[1].voice_enabled, true);
        System.assertEquals(msg.objects[1].voice_rate, '0.00500');
        System.assertEquals(msg.server_code, 200);
  }
  
  @isTest static void testGetNumberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"active": true,"added_on": "2014-10-28",' +
      '"alias": "Testing API 3","api_id": "84092103-16a3-11e6-9c82-22000ae30c11",' +
      '"application": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/16634980296193768/","carrier": "Plivo",' +
      '"monthly_rental_rate": "0.80000","number": "18583650866","number_type": "local","region": "California, UNITED STATES",' +
      '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG3AG/Number/18583650866/","sms_enabled": true,"sms_rate": "0.00000","sub_account": null,' +
      '"type": "local","voice_enabled": true,"voice_rate": "0.00850"}', 200);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('number','18583650866');
        
        PlivoNumberResponse msg = api.getNumber(params);
        System.debug(msg);
        System.assertEquals(msg.api_id, '84092103-16a3-11e6-9c82-22000ae30c11');
        System.assertEquals(msg.active, true);
        System.assertEquals(msg.added_on, '2014-10-28');
        System.assertEquals(msg.alias, 'Testing API 3');
        System.assertEquals(msg.application, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Application/16634980296193768/');
        System.assertEquals(msg.carrier, 'Plivo');
        System.assertEquals(msg.monthly_rental_rate, '0.80000');
        System.assertEquals(msg.plivo_number, '18583650866');
        System.assertEquals(msg.number_type, 'local');
        System.assertEquals(msg.region, 'California, UNITED STATES');
        System.assertEquals(msg.resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG3AG/Number/18583650866/');
        System.assertEquals(msg.sms_enabled, true);
        System.assertEquals(msg.sms_rate, '0.00000');
        System.assertEquals(msg.sub_account, null);
        System.assertEquals(msg.type, 'local');
        System.assertEquals(msg.voice_enabled, true);
        System.assertEquals(msg.voice_rate, '0.00850');
        System.assertEquals(msg.server_code, 200);
  }
  
    @isTest static void testEditNumberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "a92cf1b9-16a4-11e6-852a-22000ae28743","message": "changed"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('number','18583650866');
        params.put('alias','Plivo');
        
        PlivoGenericResponse msg = api.editNumber(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'changed');
        System.assertEquals(msg.api_id, 'a92cf1b9-16a4-11e6-852a-22000ae28743');
        System.assertEquals(msg.server_code, 202);
  }
  
  @isTest static void testUnrentNumberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('', 204);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('number','18583650866');
        
        PlivoGenericResponse msg = api.unRentNumber(params);
        System.debug(msg);
        System.assertEquals(msg.message, '');
        System.assertEquals(msg.error, null);
        System.assertEquals(msg.api_id, null);
        System.assertEquals(msg.server_code, 204);
  }
  
  @isTest static void testLinkAppNumberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "4c08dfc8-c723-11e4-af95-22000ac54c79","message": "changed"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('number','18583650866');
        params.put('app_id','27082215185108636');
        
        PlivoGenericResponse msg = api.linkApplicationNumber(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'changed');
        System.assertEquals(msg.api_id, '4c08dfc8-c723-11e4-af95-22000ac54c79');
        System.assertEquals(msg.server_code, 202);
  }
  
  @isTest static void testUnLinkAppNumberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "7b0ed1f4-16a5-11e6-852c-22000ae28743","message": "changed"}', 202);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('number','18583650866');
        params.put('app_id','');
        
        PlivoGenericResponse msg = api.linkApplicationNumber(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'changed');
        System.assertEquals(msg.api_id, '7b0ed1f4-16a5-11e6-852c-22000ae28743');
        System.assertEquals(msg.server_code, 202);
  }
  
  @isTest static void testSearchNumberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "9a04a394-16a7-11e6-924b-22000af986c2",' +
      '"meta": {"limit": 20,"next": null,"offset": 0,"previous": null,"total_count": 2},"objects": [{"country": "CYPRUS",' +
      '"lata": null,"monthly_rental_rate": "4.50000","number": "35725030608","prefix": "250","rate_center": "","region": "LIMASSOL, CYPRUS",' +
      '"resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG4OG/PhoneNumber/35725030608/","restriction": null,"restriction_text": null,' +
      '"setup_rate": "0.00000","sms_enabled": false,"sms_rate": "0.00000","type": "fixed","voice_enabled": true,' +
      '"voice_rate": "0.00500"},{"country": "CYPRUS","lata": null,"monthly_rental_rate": "4.50000","number": "35725030573","prefix": "250",' +
      '"rate_center": "","region": "LIMASSOL, CYPRUS","resource_uri": "/v1/Account/MAYMFHYZJKMJG0NJG4OG/PhoneNumber/35725030573/",' +
      '"restriction": null,"restriction_text": null,"setup_rate": "0.00000","sms_enabled": false,"sms_rate": "0.00000","type": "fixed",' +
      '"voice_enabled": true,"voice_rate": "0.00500"}]}', 200);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('country_iso','CY');
        
        PlivoPhoneNumberSearchFactory msg = api.searchPhoneNumber(params);
        System.debug(msg);
        System.assertEquals(msg.meta.previous, null);
        System.assertEquals(msg.meta.total_count, 2);
        System.assertEquals(msg.meta.offset, 0);
        System.assertEquals(msg.meta.limitt, 20);
        System.assertEquals(msg.meta.next, null);
        System.assertEquals(msg.api_id, '9a04a394-16a7-11e6-924b-22000af986c2');
        System.assertEquals(msg.objects[0].country, 'CYPRUS');
        System.assertEquals(msg.objects[0].lata, null);
        System.assertEquals(msg.objects[0].monthly_rental_rate, '4.50000');
        System.assertEquals(msg.objects[0].plivo_number, '35725030608');
        System.assertEquals(msg.objects[0].prefix, '250');
        System.assertEquals(msg.objects[0].rate_center, '');
        System.assertEquals(msg.objects[0].region, 'LIMASSOL, CYPRUS');
        System.assertEquals(msg.objects[0].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG4OG/PhoneNumber/35725030608/');
        System.assertEquals(msg.objects[0].restriction, null);
        System.assertEquals(msg.objects[0].restriction_text, null);
        System.assertEquals(msg.objects[0].setup_rate, '0.00000');
        System.assertEquals(msg.objects[0].sms_enabled, false);
        System.assertEquals(msg.objects[0].sms_rate, '0.00000');
        System.assertEquals(msg.objects[0].type, 'fixed');
        System.assertEquals(msg.objects[0].voice_enabled, true);
        System.assertEquals(msg.objects[0].voice_rate, '0.00500');
        System.assertEquals(msg.objects[1].country, 'CYPRUS');
        System.assertEquals(msg.objects[1].lata, null);
        System.assertEquals(msg.objects[1].monthly_rental_rate, '4.50000');
        System.assertEquals(msg.objects[1].plivo_number, '35725030573');
        System.assertEquals(msg.objects[1].prefix, '250');
        System.assertEquals(msg.objects[1].rate_center, '');
        System.assertEquals(msg.objects[1].region, 'LIMASSOL, CYPRUS');
        System.assertEquals(msg.objects[1].resource_uri, '/v1/Account/MAYMFHYZJKMJG0NJG4OG/PhoneNumber/35725030573/');
        System.assertEquals(msg.objects[1].restriction, null);
        System.assertEquals(msg.objects[1].restriction_text, null);
        System.assertEquals(msg.objects[1].setup_rate, '0.00000');
        System.assertEquals(msg.objects[1].sms_enabled, false);
        System.assertEquals(msg.objects[1].sms_rate, '0.00000');
        System.assertEquals(msg.objects[1].type, 'fixed');
        System.assertEquals(msg.objects[1].voice_enabled, true);
        System.assertEquals(msg.objects[1].voice_rate, '0.00500');
        System.assertEquals(msg.server_code, 200);
  }
  
  @isTest static void testBuyNumberPositive() {
      //set mock class
      PlivoHttpCalloutMockImpl mock = new PlivoHttpCalloutMockImpl('{"api_id": "aa52882c-1c88-11e4-bd8a-12313f016a39",' +
      '"message": "created","numbers": [{"number": "14154009186","status": "Success"}],"status": "fulfilled"}', 201);
      Test.setMock(HttpCalloutMock.class, mock);
        
        PlivoRestApi api = new PlivoRestApi('MAYMFHYZJKMJG0NJG3AG', 'ZDZlNzI4ZDVkNDkzYWIxMzk5NjU1ODksZWYyZeEx', 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('number','14154009186');
        
        PlivoBuyNumber msg = api.buyPhoneNumber(params);
        System.debug(msg);
        System.assertEquals(msg.message, 'created');
        System.assertEquals(msg.api_id, 'aa52882c-1c88-11e4-bd8a-12313f016a39');
        System.assertEquals(msg.numbers[0].plivo_number, '14154009186');
        System.assertEquals(msg.numbers[0].status, 'Success');
        System.assertEquals(msg.status, 'fulfilled');
        System.assertEquals(msg.server_code, 201);
  }
  
}