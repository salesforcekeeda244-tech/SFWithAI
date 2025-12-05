public with sharing class AccountsTableController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(Integer limitSize) {
        Integer rows = (limitSize == null || limitSize <= 0 || limitSize > 2000) ? 50 : limitSize;
        return [
            SELECT Id, Name, Industry, Phone, Type, Rating, AnnualRevenue
            FROM Account
            ORDER BY Name
            LIMIT :rows
        ];
    }
}
