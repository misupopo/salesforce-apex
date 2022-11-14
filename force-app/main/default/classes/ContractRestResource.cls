/**
 * 契約オブジェクトのREST API
 *
 */
@RestResource(UrlMapping='/Contract/*')
global with sharing class ContractRestResource {
    @HttpPost
    global static Contract doPostContract() {
        return new Contract();
    }
}
