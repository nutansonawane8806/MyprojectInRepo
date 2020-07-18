/**
 * Description : 
 * Created Date : 13 Jan 2020
*/
Trigger AccountTrigger on Account ( Before Insert){
/*Trigger AccountTrigger on Account ( Before Insert, Before Update, After Undelete){
    

   
    if( Trigger.isBefore ){
        if( Trigger.isInsert || Trigger.isUpdate ){
            AccountTriggerHandler.updatePicklist( Trigger.new );
        }
        if( Trigger.isUpdate ){
            AccountTriggerHandler.filterUpdatedAccounts( Trigger.new, Trigger.oldMap );
        }
    }
    if( Trigger.isAfter ){
        if( Trigger.isUndelete ){
            AccountTriggerHandler.updatePicklist( Trigger.new );
        }
    }*/
    if (Trigger.isBefore && Trigger.isInsert) {
			AccountTriggerHandler.CreateAccounts(Trigger.new);
			
	}
}