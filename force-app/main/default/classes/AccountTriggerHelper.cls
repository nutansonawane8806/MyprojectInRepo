/**
 * Description : 
 * Created Date : 13 Jan 2020
*/
public class AccountTriggerHelper {

    /*
     * Purpose :
     * Parameters : 
	*/
    public static void updateAccountPicklist( List<Account> newAccountList ){
        if( !newAccountList.isEmpty() ){
            for( Account acc : newAccountList ){
                if( acc.Name == 'Nutan' || acc.Name == 'NUTAN' || acc.Name == 'nutan' ){
                    acc.Demo_picklist__c= 'Yes';
                }
            }
        }
    }
    
    /*	Contact insert its accoun name is ABC
     * 
	*/ 
	
    public static void updateContactVerification ( List <Contact> newContactList ){
       
            
          
        
    }
}