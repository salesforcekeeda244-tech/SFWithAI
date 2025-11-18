public with sharing class ToolsForVsCode {
    public AnnonymousMethod() {
        List<Account> accList = [SELECT Id,Name FROM Account];
        System.debug('accList -->' + accList);
    }
}