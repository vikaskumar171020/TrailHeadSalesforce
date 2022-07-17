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
    handleRowAction(event){
        console.log(event.detail);
    }

    async handleSave(event){
        this.UpdatedValues = event.detail.draftValues;
        const records = this.UpdatedValues.slice().map((draftValues) => {
            const fields = Object.assign({},draftValues);
            return fields;
        });
        this.UpdatedValues = [];
        try {
            const recordUpdatePromise = records.map((record) => updateRecord(record));
            await Promise.all(recordUpdatePromise);
            this.dispatchEvent (
                new ShowToastEvent({
                    title : "Success",
                    message : "Record Updated",
                    varient : "success"
                })
            );
            await refreshApex(this.Opportunities);
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating or reloading contacts',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        }
    }

    async refresh(){
        await refreshApex(this.Opportunities);
    }
}