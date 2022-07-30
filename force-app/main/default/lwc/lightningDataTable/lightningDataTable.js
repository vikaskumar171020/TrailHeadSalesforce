import { LightningElement,wire,track } from 'lwc';
import getContactList from '@salesforce/apex/OpportunityController.getContactList';
import getOpportunityList from '@salesforce/apex/OpportunityController.getOpportunityList';
import { NavigationMixin } from 'lightning/navigation';
import DeleteRecord from '@salesforce/apex/OpportunityController.DeleteRecord';
import { refreshApex } from '@salesforce/apex';
const actions = [
    {label:"Show Detail",name: "show_details"},
    {label:"Delete",name:"delete"},
];

const columnContact = [
    {label:'Name',fieldName:'Name'},
    {label:'FirstName',fieldName:'FirstName'},
    {label:'LastName',fieldName:'LastName'},
    {label:'Email',fieldName:'Email'},
    {
        type:'action',
        typeAttributes:{
            rowActions:actions,
        },
    },
];

const columnOpportunity = [
    {label:"Id",fieldName:"Id"},
    {label:"Name",fieldName:"Name",editable:true},
    {label:"StageName",fieldName:"StageName",editable:true},
    {label:"CloseDate",fieldName:"CloseDate",type:"Date",editable:true},
    {label:"Amount",fieldName:"Amount",editable:true},
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    }
];

export default class LightningDataTable extends NavigationMixin(LightningElement) {
    @track Contacts;
    @track Opportunities;
    @wire (getContactList) condata(data,error){
        if(data){
            this.Contacts = data;
        }
    };
    @wire (getOpportunityList) oppdata(data,error){
        if(data){
            this.Opportunities = data;
        }
    };
    columnOpportunity = columnOpportunity;
    columnContact = columnContact;

    RowAction(event){
        const { id } = event.detail.row;
        console.log(event.detail.action.name);
        if(event.detail.action.name == 'show_details'){
            // console.log(window.location.origin);
            window.location.href = window.location.origin +'/'+event.detail.row.Id;
        }else if(event.detail.action.name == 'delete'){
            console.log(event.detail.row.Id);
            DeleteRecord({
                RecordId:event.detail.row.Id
            }).then(res => {
                console.log(res);
            }).catch(error => {
                console.log(error);
            });
            refreshApex(this.Opportunities);
            refreshApex
        }
        console.log('Hi');
    }

    refresh(){
        refreshApex(this.Contacts);
        refreshApex(this.Opportunities);
    }

    CreateOpportunity(event){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity',
                actionName: 'new'
            },
        });
        this.refresh();
    }

    CreateContact(event){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
        });
        this.refresh();
    }
}