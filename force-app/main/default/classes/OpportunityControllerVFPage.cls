global with sharing class OpportunityControllerVFPage {
    global static List<Opportunity> OppLis {get;set;}
    global OpportunityControllerVFPage() {
        OppLis = [SELECT Name,StageName,CloseDate FROM Opportunity WITH SECURITY_ENFORCED];
    }
}
