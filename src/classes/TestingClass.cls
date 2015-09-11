@isTest
public class TestingClass {
    static testMethod void validateRestApi() {
        String auth_Id = '';
        String auth_Token = '';
    
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('src','18583650866');
        params.put('dst','12109206499');
        params.put('text','Testing');
        
        Boolean containsrc = params.containsKey('src');
        System.assertEquals(true, containsrc);
        
        Boolean containdst = params.containsKey('dst');
        System.assertEquals(true, containdst);
        
        Boolean containtext = params.containsKey('text');
        System.assertEquals(true, containtext);
    
        MessageResponse msg = api.sendMessage(params);
        Integer status = msg.server_code;
        System.assertEquals(202, status);
        
    }    
}