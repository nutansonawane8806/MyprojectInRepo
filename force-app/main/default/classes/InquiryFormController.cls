public class InquiryFormController {

    @AuraEnabled
    public static FinalWrapper getCustContactNo( String customerName){
        
        FinalWrapper fw = new FinalWrapper();
        System.debug('Customer Name is '+customerName);
        
        Customer__c customer = new Customer__c();
        List<String> custlist = new List<String>();
        customer = [ SELECT id , Name , Contact_No__c,Email__c From Customer__c WHERE Name = :customerName];
        
        fw.ContactNo = Integer.valueOf(customer.Contact_No__c);
        return fw;
        
    }
    @AuraEnabled
    public static void storeData( String customerName, Date date1, Integer Contact, 
                                 String srcIqry, String Product, Integer Quot, String Status, 
                                 Date FollowupDate, String Descr, boolean CheckorNot )
    {                          
        System.debug('CustName in storedata '+customerName);
        System.debug('date1 '+date1);
        System.debug('CustName Contact '+Contact);
        System.debug('CustName srcIqry'+srcIqry);
        System.debug('Product '+Product);
        System.debug('Quot '+Quot);
        System.debug('Status '+Status);
        System.debug('FollowupDate '+FollowupDate);
        System.debug('Descr '+Descr);
        System.debug('CheckorNot '+CheckorNot);
        
        Inquiry_Entries__c IE = new Inquiry_Entries__c();
       	                             
        IE.Customer_Name__c = customerName;
        IE.Date__c = date1;
        IE.Contact_No__c = Contact;
        IE.Source_Of_Inquiry__c = srcIqry;
        IE.Product__c = Product;
        IE.Quotation__c = Quot;
        IE.Status__c = Status;
        IE.Followup_Date__c = FollowupDate;
        IE.Descriptions__c = Descr;
        IE.Followup__c = CheckorNot;
        
        System.debug('Data '+IE.Customer_Name__c);        
        Insert IE;
        
    }
    
    public class ResultWrapper{
      
        @AuraEnabled
        public String CustName, Email;
        
        
      
   }
    public class FinalWrapper{
      
       @AuraEnabled
       public List<ResultWrapper> CustomerList = new List<ResultWrapper>();
        
       @AuraEnabled
       public Integer ContactNo; 
        
   }

    
}