trigger AccountAddressTrigger on Account (before insert, before update) 
{
	for(Account obj : Trigger.new)
    {
       
        if(obj.Match_Billing_Address__c == true && obj.BillingPostalCode!=null)
        {
            obj.ShippingPostalCode=obj.BillingPostalCode;
            
        }
        
    }
    
}