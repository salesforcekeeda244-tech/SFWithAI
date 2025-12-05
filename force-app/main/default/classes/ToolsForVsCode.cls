/**
 * Utility methods for the VS Code development environment.
 * Provides helper methods for retrieving sample Account data for demos and testing.
 *
 * Notes:
 * - Uses WITH SECURITY_ENFORCED to respect field- and object-level security.
 * - Intended for use from Lightning (Aura/LWC) via @AuraEnabled methods.
 */
public with sharing class ToolsForVsCode {
    /**
     * Retrieves a sample list of Account records with Id and Name fields.
     * This method is AuraEnabled and can be called from Lightning components.
     *
     * @return List<Account> A list (up to 10) of Account records containing Id and Name.
     * @example List<Account> sample = ToolsForVsCode.getSampleAccounts();
    */
    @AuraEnabled
    public static List<Account> getSampleAccounts() {
        /*
            @AuraEnabled
            * Retrieves a sample list of Account records with Id and Name fields.
            * This method is AuraEnabled and can be called from Lightning components.
        */
        List<Account> accList = [
            SELECT Id, Name
            FROM Account
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
        return accList;
    }
}
