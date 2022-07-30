import { LightningElement,wire } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import getContactList from '@salesforce/apex/OpportunityController.getContactList';
const actions = [
    {label:"Show Detail",name: "show_details"},
    {label:"Delete",name:"delete"},
];
const column = [
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
    @wire (getContactList)
    Opportunities;
    UpdatedValues=[];
    column = column;
}