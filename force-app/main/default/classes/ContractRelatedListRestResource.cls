/**
 * 契約一覧取得のREST API
 * 
 */
@RestResource(urlMapping='/ContractRelatedList/*')
global with sharing class ContractRelatedListRestResource {

    @HttpGet
    global static void doGetContractRelatedList() {
        RestRequest req = RestContext.request;
        String rowLimit = req.params.get('rowLimit');
        String offset = req.params.get('offset');
        List<Contract> contList = ContractDao.findContractAll(rowLimit, offset);
        
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize(contList));
    }

    @HttpPost
    global static void doTest() {
        Map<String, String> m1 = new Map<String, String>();
        m1.put('test1', 'First item');
        m1.put('test2', 'Second item');
        Blob.valueOf(JSON.serialize(m1));
    }
}