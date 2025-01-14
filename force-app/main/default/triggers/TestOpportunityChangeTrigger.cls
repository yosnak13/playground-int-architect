/**
 * Created by yoshihisanakai on 2025/01/14.
 */

@IsTest
private class TestOpportunityChangeTrigger {
  @IsTest
  static void testCreateAndUpdateOpportunity() {
    Test.enableChangeDataCapture();
    insert new Opportunity(
        Name = 'Sell 100 Widgets',
        StageName = 'Prospecting',
        CloseDate = Date.today().addMonths(3)
    );
    Test.getEventBus().deliver();

    Opportunity[] oppRecords = [SELECT Id, StageName FROM Opportunity];
    Opportunity opp = oppRecords[0];
    System.debug('Retrieved Opportunity record: ' + opp);
    opp.StageName = 'Closed Won';
    update opp;

    // Call deliver to fire the trigger for the update operation.
    Test.getEventBus().deliver();
    // VERIFICATIONS
    Task[] taskList = [SELECT Id, Subject FROM Task];
    System.assertEquals(1, taskList.size(), 'The change event trigger did not create the expected task.');
  }
}
