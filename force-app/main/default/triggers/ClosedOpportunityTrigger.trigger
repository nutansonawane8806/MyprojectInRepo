trigger ClosedOpportunityTrigger on Opportunity (after insert , after update)
{
    List<Task> tasklist=new List<Task>();
	for(Opportunity obj : Trigger.new)
    {
        if(obj.stageName=='Closed Won')
        {
            Task task=new Task();
            task.subject='Follow Up Test Task';
            task.WhatId=obj.id;
            tasklist.add(task);
        }
        
    }
    insert tasklist;
}