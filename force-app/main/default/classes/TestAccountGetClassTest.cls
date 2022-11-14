@isTest(SeeAllData=true)

private class TestAccountGetClassTest {

  @isTest static void testMethod1() {

    Test.startTest();

  Integer cnt = TestAccountGetClass.getAccountSize();

    Test.stopTest();

System.assertEquals(2,cnt);

  }

}