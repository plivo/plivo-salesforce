public class ShowContacts {
    string accid= ApexPages.currentPage().getParameters().get('accid');

    public list<Contact> contlist{get;set;}
    
    public ShowContacts(){
        
        System.debug('accid : ' + accid);
        if(accid !=null ){
            contlist= [select id,firstname,lastname,phone,email from contact where accountid=:accid];
            System.debug('contlist : ' + contlist);
        }
    }
    
    public PageReference cancel() {
        URL currentURL = URL.getCurrentRequestUrl();
        system.debug('currentURL.getPath()->'+currentURL.getPath());
        account acc = new account();
        // Send the user to the detail page for the new account.
        PageReference acctPage = new PageReference('/'+accid);
        acctPage.setRedirect(true);
        
        return acctPage;
    }
}