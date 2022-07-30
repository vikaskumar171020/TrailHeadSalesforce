public with sharing class OpportunityController {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Name,FirstName,LastName,Email FROM Contact];
    }

    @AuraEnabled(Cacheable=true)
    public static List<Opportunity> getOpportunityList(){
        return [SELECT Id,Name,StageName,CloseDate,Amount FROM Opportunity LIMIT 10];
    }

    @AuraEnabled
    public static String DeleteRecord(Id RecordId){
        try {
            String ObjectName = RecordId.getSobjectType().getDescribe().getName();
            SObject record = Database.query('SELECT Id from '+ObjectName+' Where Id =\''+RecordId+'\'');
            delete record;
            return 'Record deleted successfully';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}