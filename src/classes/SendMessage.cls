public class SendMessage 
{

    public String inp1;
    public String inp2;
    public String inp3;
    public String inp4;
    public String inp5;
    
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
  
    public Boolean isChk1 { get; set; }
    
    public Boolean isChk2 { get; set; }

    
    public void send(){
    
        String authid = 'MAYMFHYZJKMJG0NJG4OG';
        String authtoken = 'ZDZlNzI1ZDVkNDkzYWIxMzk5NjU1ODkzZWYyZmEx';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.plivo.com/v1/Account/MAYMFHYZJKMJG0NJG4OG/Message/');
        req.setMethod('POST');
        Blob headerValue = Blob.valueOf(authid + ':' + authtoken);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');
        req.setBody('{"src":"'+inp1+'","dst":"'+inp2+'","text":"'+inp3+'"}');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
    }
    
        public void call()
    {
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