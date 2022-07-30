global with sharing class OpportunityControllerVFPage {
    global static List<Contact> OppLis {get;set;}
    global OpportunityControllerVFPage() {
        // OppLis = [SELECT Name,StageName,CloseDate FROM Opportunity WITH SECURITY_ENFORCED];
        OppLis = [SELECT Name FROM Contact WITH SECURITY_ENFORCED];
        System.debug(OppLis);
    }
}
