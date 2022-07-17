public without sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getContactList() {
        return [SELECT Id,Name,StageName,CloseDate,Amount FROM Opportunity WITH SECURITY_ENFORCED LIMIT 10];
    }
}