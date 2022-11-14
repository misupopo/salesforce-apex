@RestResource(UrlMapping='/test/*')
global with sharing class RequestTest {
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
}