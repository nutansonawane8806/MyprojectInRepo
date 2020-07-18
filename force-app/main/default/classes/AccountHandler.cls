public class AccountHandler 
{
    	public static Account insertNewAccount(String Name)
        {
            Account obj = new Account();
            obj.Name = Name;
            
            try
            {
                insert obj;
                
            }
            catch(DMLException err)
            {
                return null;
            }
            return obj;
        }
    

}