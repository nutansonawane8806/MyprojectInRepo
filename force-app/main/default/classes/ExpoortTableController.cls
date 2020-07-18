public class ExpoortTableController {
    
     @AuraEnabled
    public static void sendOppDetails(String attachmentBody, String attachmentName)
    {
        Id currentUserId = UserInfo.getUserId();
        User userDetail = [select id, Email from User where id =: currentUserId];
        
        String[] toAddress = new String[]{userDetail.Email};
        
        List<Messaging.Emailfileattachment> lstEfa = new List<Messaging.Emailfileattachment>();        
        Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
        efa.setFileName(attachmentName);
        efa.setBody(blob.valueOf(attachmentBody));        
        lstEfa.add(efa);
        
        Messaging.SingleEmailMessage emailMesg = new Messaging.SingleEmailMessage();
        emailMesg.setToAddresses(toAddress);
        emailMesg.setPlainTextBody('Hello');
        emailMesg.setSubject('Opportuntiy Details');    
        emailMesg.setFileAttachments(lstEfa);            
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { emailMesg });
    }
    
    @AuraEnabled
    public static List<Opportunity> loadOppDetails()
    {
        return [Select id, Name, Account.Name from Opportunity Limit 20];
    }

}