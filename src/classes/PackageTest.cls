public class PackageTest{
    
    public PackageTest(ApexPages.StandardSetController controller) { 
        
    }

    public String inp1;
    public String inp2;
    public String inp3;
    public String inp4;
    public String inp5;
    public Integer inp6;
    public String inp7;
    public String inp8;
    public String inp9;
    public Integer inp10;
    public String inp11;
    public String inp12;
    public String inp13;
    public String inp14;
    public String inp15;
    public String inp16;
    public String inp17;
    public String inp99;
    public String inp100;
    public String inp101;
    public String inp102;
    
    public String getInp1(){
        return inp1;
    }

    public void setInp1(String str1){
        inp1 = str1;
    }

    public String getInp2(){
        return inp2;
    }

    public void setInp2(String str2){
        inp2 = str2;
    }     
    
    public String getInp3(){
        return inp3;
    }

    public void setInp3(String str3){
        inp3 = str3;
    } 
    
    public String getInp4(){
        return inp4;
    }

    public void setInp4(String str4){
        inp4 = str4;
    } 
    
    public String getInp5(){
        return inp5;
    }

    public void setInp5(String str5){
        inp5 = str5;
    }
    
    public Integer getInp6(){
        return inp6;
    }

    public void setInp6(Integer str6){
        inp6 = str6;
    }
    
    public String getInp7(){
        return inp7;
    }

    public void setInp7(String str7){
        inp7 = str7;
    }
  
    public String getInp8(){
        return inp8;
    }

    public void setInp8(String str8){
        inp8 = str8;
    }
    
    public String getInp9(){
        return inp9;
    }

    public void setInp9(String str9){
        inp9 = str9;
    }
    
    public Integer getInp10(){
        return inp10;
    }

    public void setInp10(Integer str10){
        inp10 = str10;
    }
    
    public String getInp11(){
        return inp11;
    }

    public void setInp11(String str11){
        inp11 = str11;
    }
    
    public String getInp12(){
        return inp12;
    }

    public void setInp12(String str12){
        inp12 = str12;
    }
    
    public String getInp13(){
        return inp13;
    }

    public void setInp13(String str13){
        inp13 = str13;
    }
    
    public String getInp14(){
        return inp14;
    }

    public void setInp14(String str14){
        inp14 = str14;
    }
    
    public String getInp15(){
        return inp15;
    }

    public void setInp15(String str15){
        inp15 = str15;
    }
    
    public String getInp16(){
        return inp16;
    }

    public void setInp16(String str16){
        inp16 = str16;
    }
    
    public String getInp17(){
        return inp17;
    }

    public void setInp17(String str17){
        inp17 = str17;
    }
    
    public String getInp99(){
        return inp99;
    }

    public void setInp99(String str99){
        inp99 = str99;
    }
    
    public String getInp100(){
        return inp100;
    }

    public void setInp100(String str100){
        inp100 = str100;
    }
    public String getInp101(){
        return inp101;
    }

    public void setInp101(String str101){
        inp101 = str101;
    }
    
    public String getInp102(){
        return inp102;
    }

    public void setInp102(String str102){
        inp102 = str102;
    }
    
    public Boolean isChk1 { get; set; }
    
    public Boolean isChk2 { get; set; }
    
    public Boolean isChk3 { get; set; }
    
    public Boolean isChk4 { get; set; }
    
    public Boolean isChk5 { get; set; }
    
    public Boolean isChk6 { get; set; }
    
    public pagereference openPop(){
        pagereference redirect = new PageReference('/apex/send_message');
        redirect.setRedirect(true);
        system.debug('Hello@@'+redirect);
        return redirect;
    }
    
    
     public void sendMsg() {
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1'); 
         
        Map<String, String> params = new Map<String, String> ();
        params.put('src',inp1);
        params.put('dst',inp2);
        params.put('text',inp3);
        
        System.debug (params);
        
        System.debug ('Sending message now');
        MessageResponse msg = api.sendMessage(params);
        String api_id = msg.api_id;
        System.debug (msg);
        SetInp16(msg.toString());
        
    }
    
    public void bulkMsg() {
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1'); 
         
        Map<String, String> params = new Map<String, String> ();
        params.put('src',inp99);
        params.put('dst',inp100);
        params.put('text',inp101);
        
        System.debug ('params : ' + params);
        
        System.debug ('Sending Bulk message now');
        MessageResponse msg = api.sendMessage(params);
        String api_id = msg.api_id;
        System.debug (msg);
        SetInp102(msg.toString());
        
    }
    
    public void getMessageDetails(){
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        
        String message_uuid = inp4;
        Map<String, String> params = new Map<String, String> ();
        params.put('message_uuid',message_uuid);
        System.debug(params);
        
        System.debug ('Getting Message detiails');
        Message getMsg = api.getMessage(params);
            
        System.debug ('From controller : ' + getMsg);
        System.debug('String Format : ' + getMsg.toString());
        
        setInp5(getMsg.toString());
    }
    
    public void getAllMessageDetails(){
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        Map<String, String> params = new Map<String, String> ();
        if (String.isNotEmpty(inp8)){
            String message_state = inp8;    
            params.put('message_state',message_state);
        }
        if(String.isNotEmpty(inp9)){
            String message_direction = inp9;    
            params.put('message_direction',message_direction);
        }
        
        System.debug(params);
        
        System.debug ('Getting All Message detiails with Filter');
        MessageFactory getMsgs = api.getMessages(params);
        
        System.debug ('From controller : ' + getMsgs);
        System.debug('String Format : ' + getMsgs.toString());
        MessageMeta total = getMsgs.meta;
        
        System.debug('total count : ' + total.total_count);
        setInp10(total.total_count);
        setInp11(getMsgs.toString());
    }
    
    public void message_xml(){
        
        String from_number = inp12;
        String to_number = inp13;
        String text_message = inp14;
        
        PlivoResponse response = new PlivoResponse();
        
        MessageXML msg_xml = new MessageXML(text_message);
        msg_xml.setSource(from_number);
        msg_xml.setDestination(to_number);
        
        try {
            response.append(msg_xml);
            System.debug(response.toXML());
            setInp15(response.toXML());
        } catch (PlivoException e) {
            e.getMessage();
        } 
    }
    
    public void makeCall()
    {
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1'); 
         
        Map<String, String> params = new Map<String, String> ();
        params.put('from',inp1);
        params.put('to',inp2);
        params.put('answer_url','https://s3.amazonaws.com/static.plivo.com/answer.xml');
        params.put('answer_method','GET');
        
        System.debug (params);
        
        System.debug ('Making call now');
        Call call_resp = api.makeCall(params);
        System.debug ('API Response : ' + call_resp);
        SetInp3(call_resp.toString());
    
    }
    
    public void getAllCallDetails(){
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        if (String.isNotEmpty(inp4)){
            String from_number = inp4;    
            params.put('from_number', from_number);
        }
        if(String.isNotEmpty(inp5)){
            String to_number = inp5;    
            params.put('to_number', to_number);
        }
        if(String.isNotEmpty(inp7)){
            String call_direction = inp7;    
            params.put('call_direction', call_direction);
        }
        
        CDRFactory getCalls = api.getCDRs(params);
        CDRMeta total = getCalls.meta;
        setInp6(total.total_count);
        setInp8(getCalls.toString());
    }
    
    public void getCallDetails(){
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid',inp9);
        
        System.debug(params);
        
        System.debug ('Getting Call detiails');
        CDR getCall = api.getCDR(params);
        setInp11(getCall.toString());
    }
    
    public void getLiveCallDetails(){
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        
        Map<String, String> params = new Map<String, String> ();
        params.put('call_uuid',inp12);
        
        System.debug(params);
        
        System.debug ('Getting Call detiails');
        LiveCall getLiveCall = api.getLiveCall(params);
        setInp13(getLiveCall.toString());
    }
    
    public void getAllLiveCallDetails(){
        String auth_Id = 'MAYMFHYZJKMJG0NJG4OG';
        String auth_Token = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        RestAPI api = new RestAPI(auth_Id, auth_Token, 'v1');
        
        LiveCallFactory getLiveCalls = api.getLiveCalls();
        setInp14(getLiveCalls.toString());
    }
    
    public void dial_xml(){
        
        String from_number = inp15;
        String to_number = inp16;
        
        PlivoResponse response = new PlivoResponse();
        
        DialXML dial_xml = new DialXML();
        dial_xml.setCallerId(from_number);
        DialNumberXML num = new DialNumberXML(to_number);
        
        try {
            dial_xml.append(num);
            response.append(dial_xml);
            System.debug(response.toXML());
            setInp17(response.toXML());
        } catch (PlivoException e) {
            e.getMessage();
        } 
    }
    
    public void call(){
        String authid = 'MAYMFHYZJKMJG0NJG4OG';
        String authtoken = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';    
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.plivo.com/v1/Account/MAYMFHYZJKMJG0NJG4OG/Call/');
        req.setMethod('POST');
        Blob headerValue = Blob.valueOf(authid + ':' + authtoken);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');
        req.setBody('{"from":"18583650866","to":"'+inp4+'","answer_url":"http://morning-ocean-4669.herokuapp.com/salesforceanswer/' + inp5 +'","answer_method":"GET"}');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
    }
}