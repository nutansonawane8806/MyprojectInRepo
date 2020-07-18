/**
 * Description : 
 * Created Date : 13 Jan 2020
*/
public class AccountTriggerHandler {

    /*
     * Purpose :
     * Parameters : 
	*/
   /* public static void updatePicklist( List<Account> newAccountList ){
        if( !newAccountList.isEmpty() ){
            AccountTriggerHelper.updateAccountPicklist( newAccountList );
        }
    }
    
    public static void filterUpdatedAccounts( List<Account> newAccountList, Map<Id, Account> oldAccIdToValMap ){
        if( !newAccountList.isEmpty() && !oldAccIdToValMap.isEmpty()){
            
            List<Account> filteredAccList = new List<Account>();
            
            for( Account acc : newAccountList ){
                if( acc.Name == 'Nutan' && oldAccIdToValMap.get( acc.Id ).Name != 'Nutan' ){
                    filteredAccList.add( acc  );
                }
            }
            if( filteredAccList.size() > 0 ){
                AccountTriggerHelper.updateAccountPicklist( filteredAccList );
            }
        }
    }*/
    public static void CreateAccounts(List<Account> acclist){
        
        
        for(Account a:acclist){
            
            if(a.ShippingState!=a.BillingState){
                a.ShippingState =a.BillingState;
              
            }
        }
    }
}