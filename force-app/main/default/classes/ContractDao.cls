public with sharing class ContractDao {
    public static List<Contract> findContractAll(String rowLimit, String offset){
        String soqlStr = 'SELECT Id ';
        soqlStr +=' ,Name ';
        soqlStr +=',ContractNumber ';
        soqlStr +=',StartDate ';
        soqlStr +=' ,EndDate ';
        //soqlStr +=',ActivatedDate ';
        //soqlStr +=' ,Status';
        soqlStr +=',ContractTerm ';
        soqlStr +=',CustomerSignedDate ';
        soqlStr +=',AccountId ';
        soqlStr +='FROM ';
        soqlStr +='Contract ';
        //LIMIT
        if (rowLimit != null) {
            soqlStr += 'LIMIT ' + rowLimit;
        }
        //OFFSET
        if (offset != null) {
            soqlStr =+ 'OFFSET ' + offset;
        }

        return Database.query(soqlStr);
    }
}
