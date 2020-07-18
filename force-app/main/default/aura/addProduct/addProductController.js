({
	handleSubmit : function(component, event, helper) {
        
       console.log('handleSubmit '); 
       var allValid = component.find('fieldId').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && !inputCmp.get('v.validity').valueMissing;
        }, true);
         
        if (allValid) {
            
            console.log('allValid '); 
            var ProdFamily = component.find("ProductFamil").get("v.value");            
            var Product = component.get('v.Product');
            console.log('product family ',ProdFamily);
            console.log('product ',Product);
            
            var action = component.get('c.storeProduct');
            
            action.setParams({ProductFamily : ProdFamily, Product : Product });
            
            console.log('Pameters setted');
                action.setCallback(this, function(response) {    
                console.log('setCallback');    
        		var state = response.getState();        
                if (state === "SUCCESS") { 
                                                   
                    console.log('SUCCESS');
                    alert('Product added successfully');
                    
                }
                else{
                    console.log('Error');
                }
             
        	});
        } 
        else{
            
            alert('Enter Valid Data');
        }
		$A.enqueueAction(action); 
	}
})