/**
 * Created by yoshihisanakai on 2025/01/14.
 */

trigger OrderEventTrigger on Order_Event__e (after insert) {
  List<Task> tasks = new List<Task>();
  for (Order_Event__e event : Trigger.new) {
    if (event.Has_Shipped__c == true) {
      Task tk = new Task(
          Priority = '中',
          Subject = '発送済み注文のフォローアップ 105',
          OwnerId = event.CreatedById
      );
      tasks.add(tk);
    }
  }
  insert tasks;
}
