public with sharing class OpportunityControllerVFPage {
    public Opportunity Opp {get;set;}
    public List<Opportunity> OppLis {get;set;}
    public OpportunityControllerVFPage() {
        Opp = new Opportunity();
        OppLis = new List<Opportunity>();
    }

    public void ShowOpp() {
        if(Opp.StageName == 'Prospecting'){
            OppLis = [SELECT Name,StageName FROM Opportunity where StageName= 'Prospecting' LIMIT 2];
        }else {
            OppLis = [SELECT Name,StageName FROM Opportunity LIMIT 2];
        }
    }
}
