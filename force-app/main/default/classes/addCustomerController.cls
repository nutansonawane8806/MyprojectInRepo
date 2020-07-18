public class addCustomerController {

    
    @AuraEnabled
    public static void storeData( String CustNAme, String Email, String Company, String Contact, String ContPerson){
        
        System.debug('This is stored data');
        System.debug('CustNAme' +CustNAme);
        System.debug('Email '+Email);
        System.debug('Company '+Company);
        System.debug('Contact '+Contact);
        
        Customer__c cust = new Customer__c();
        
        cust.Name = CustNAme;
        cust.Email__c = Email;
        cust.Company_Name__c = Company;
        cust.Contact_No__c = Contact;
		cust.Contact_Person__c = ContPerson;       
        
        Insert cust;
        
    }
    @AuraEnabled
    public static void storeProduct(String ProductFamily , String Product){
        
        Product2 prod = new Product2();
        prod.Name = Product;
        prod.Family = ProductFamily;
        
        Insert prod;
                
    }
   
}