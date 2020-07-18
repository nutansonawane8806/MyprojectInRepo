public class ContactAndLeadSearch 
{
    public static List<List< SObject>> searchContactsAndLeads(String Smith)
    {
        
        List<List<sObject>> searchList = [FIND :Smith IN ALL FIELDS 
                   RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        System.debug(searchList);
        
        return searchList;
        
    }

}