import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountsTableController.getAccounts';

export default class AccountsTable extends LightningElement {
    @track rows = [];
    columns = [
        { label: 'Name', fieldName: 'recordUrl', type: 'url', typeAttributes: { label: { fieldName: 'Name' }, target: '_self' } },
        { label: 'Industry', fieldName: 'Industry', type: 'text' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Type', fieldName: 'Type', type: 'text' },
        { label: 'Rating', fieldName: 'Rating', type: 'text' },
        { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency', typeAttributes: { currencyCode: 'USD' } }
    ];

    @wire(getAccounts, { limitSize: 50 })
    wiredAccounts({ error, data }) {
        if (data) {
            this.rows = data.map(acc => ({
                ...acc,
                recordUrl: '/' + acc.Id
            }));
        } else if (error) {
            // Basic inline error surface; in real usage, consider a toast event from lightning/platformShowToastEvent
            // eslint-disable-next-line no-console
            console.error('Error loading accounts', error);
        }
    }
}
