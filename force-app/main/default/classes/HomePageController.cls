public class HomePageController {
    
    @AuraEnabled
    public static FinalWrapper getCustomer(){
        
              
        Integer Month = Date.Today().Month();
        Integer Year = Date.Today().Year();
        DateTime d = datetime.now();
        System.debug(' Current Month '+Month);
        
        Integer j=1,i=0,k=0;
        List<String> monthList = new List<String>();
        
        
        if(Month > 3){
                        
            for( i=Month;i<=11;i++ ){                
				String monthName= d.AddMonths(j).format('MMM')+'-'+Year;
                monthList.add(monthName);
                j++;
            }
            for( k=i;k<=14;k++ ){
                
                String monthName= d.AddMonths(j).format('MMM')+'-'+(Year+1);
                monthList.add(monthName);
                j++;
                
            }
           
            
            System.debug('Next months to Current Month '+monthList);
        }
        else{
            
            for( i=Month;i<3;i++){ 
                
				String monthName= d.AddMonths(j).format('MMM')+'-'+Year;
                monthList.add(monthName);
                j++;
            }
        }
        
        
        FinalWrapper fw = new FinalWrapper();
        List<Customer__c> Allcustomerlist = new List<Customer__c>();
        List<Product2> Productlist = new List<Product2>();
        
        
        List<String> custlist = new List<String>();
        Allcustomerlist = [ SELECT id , Name , Contact_No__c,Email__c From Customer__c];
        Productlist = [ SELECT id , Name From Product2];
        
        for( Customer__c cust : Allcustomerlist){
            
           ResultWrapper rw = new ResultWrapper();
           rw.CustName = cust.Name;
           rw.Email = cust.Email__c;
           rw.ContactNo = cust.Contact_No__c;
            
           fw.CustomerList.add(rw);
        }
        
        for( Product2 prod : Productlist){
            
           ProductWrapper pw = new ProductWrapper();
           pw.ProductName = prod.Name;
            
           fw.ProductList.add(pw);
 
        }
        System.debug('fw.ProductList '+fw.ProductList);
      	
        return fw;
        
        
    }
    
    public class ResultWrapper{
      
        @AuraEnabled
        public String CustName, Email;
        
        @AuraEnabled
        public String ContactNo; 
      
   }
    public class ProductWrapper{
      
        @AuraEnabled
        public String ProductName;
        
      
   }
    public class FinalWrapper{
      
       @AuraEnabled
       public List<ResultWrapper> CustomerList = new List<ResultWrapper>();
        
       @AuraEnabled
       public List<ProductWrapper> ProductList = new List<ProductWrapper>();
        
   }


}