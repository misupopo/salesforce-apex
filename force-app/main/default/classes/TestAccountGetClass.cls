public class TestAccountGetClass {

  public static Integer getAccountSize(){

    return [SELECT Id, Name FROM Account Limit 2].size();

  }

}