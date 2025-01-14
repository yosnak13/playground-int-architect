/**
 * Created by yoshihisanakai on 2025/01/14.
 */

trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
  List<Task> tasks = new List<Task>();
  // Iterate through each event message.
  for (OpportunityChangeEvent event : Trigger.new) {
    // Get some event header fields
    EventBus.ChangeEventHeader header = event.ChangeEventHeader;
    System.debug('Received change event for ' +
        header.entityName +
        ' for the ' + header.changeType + ' operation.');
    // For update operations, we can get a list of changed fields
    if (header.changeType == 'UPDATE' && event.IsWon == true) {
      // Create a followup task
      Task tk = new Task();
      tk.Subject = 'Follow up on won opportunities: ' + header.recordIds;
      tk.OwnerId = header.commitUser;
      tasks.add(tk);
    }
  }
  // Insert all tasks in bulk.
  if (tasks.size() > 0) {
    insert tasks;
  }
}
