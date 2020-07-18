public class ContactSearch 
{
    public static List<Contact> searchForContacts(String LastName, String MailPCode)
    {
        List<Contact> result = [Select id, Name From Contact Where ( lastname = :LastName And MailingPostalCode = :MailPCode)];
        return result;
    }

}