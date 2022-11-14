@RestResource(UrlMapping='/test/*')
global with sharing class RequestTest {
    // Get Method
    // https://$(salesforce url)/services/apexrest/test/request
    @HttpGet
    global static void request() {
        RestRequest req = RestContext.request;
        RestContext.response.addHeader('Content-Type', 'application/json');

        String myJson ='[{"color":"red"}, {"color":"green"}, {"color":"blue"}]';
        List<Object> jsonList = (List<Object>) JSON.deserializeUntyped(myJson);
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize(jsonList));
    }

    @HttpPost
    global static void requestPost(String accountName) {
        RestRequest req = RestContext.request;
        RestContext.response.addHeader('Content-Type', 'application/json');

        // このやり方だとエスケープされた JSON の文字列が返ってくる
        // 例（\{\"test\"\: \"test\"\}）
        // String myJson ='{"test": "test"}';
        Map<String, String> m1 = new Map<String, String>();
        m1.put('accountName', accountName);

        RestContext.response.responseBody = Blob.valueOf(JSON.serialize(m1));
    }

    // CustomClass で deserialize するやり方
//    @HttpPost
//    global static CustomClass doPost() {
//        CustomClass a = (CustomClass) JSON.deserialize(RestContext.request.requestBody.toString(), CustomClass.class);
//        System.debug(a);
//        System.debug(a);
//
//        return a;
//    }

    // HttpGet や HttpPost や HttpPut は一つずつしか存在できない
    @HttpPut
    global static String superTest() {
        String payload = '{"Header": {"Status": "test"}}';

        Map<String, Object> mainNode;
        mainNode = (Map<String, Object>)JSON.deserializeUntyped(payload);

        return mainNode.toString();
    }
}
