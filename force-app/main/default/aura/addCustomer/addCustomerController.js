({
	handleSubmit : function(component, event, helper) {
        
       var allValid = component.find('fieldId').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && !inputCmp.get('v.validity').valueMissing;
        }, true);
         
        if (allValid) {
            
            
             var custName = component.get('v.custName');
             var custEmail = component.get('v.custEmail');
             var custCon = component.get('v.custContact');
             var Company = component.get('v.company');
             var CotPerson = component.get('v.cotPerson');
            
            console.log('custName',custName);
            console.log('custEmail',custEmail);
            console.log('custCon',custCon);
            console.log('Company',Company);
            
            var action = component.get('c.storeData');       
            action.setParams({CustNAme : custName, Email : custEmail, Contact: custCon, Company:Company, ContPerson:CotPerson});
            
            console.log('Pameters setted');
                action.setCallback(this, function(response) {    
                console.log('setCallback');    
        		var state = response.getState();        
                if (state === "SUCCESS") { 
                                                   
                    console.log('SUCCESS');
                    alert('Customer added successfully');
                    
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