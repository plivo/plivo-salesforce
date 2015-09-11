@isTest 
global class YourHttpCalloutMockImpl implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        //System.assertEquals('https://api.plivo.com/v1/Account/MAYMFHYZJKMJG0NJG4OG/Message/', req.getEndpoint());
        //System.assertEquals('POST', req.getMethod());
        HttpResponse res = new HttpResponse();
        
        res.setHeader('Content-Type', 'application/json');
        res.setStatusCode(202);
        return res;
    }
}