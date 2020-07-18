({
	Calculate : function(component, event, helper) {
        
        var Rs = component.get('v.numberInput');
		var action = component.get('c.callAPI');
        action.setParams({ Rs:Rs });
        console.log('Set Param');
		        
		action.setCallback(this, function(response) {            	
        		var state = response.getState();
                if (state === "SUCCESS") {
                    
                     console.log('Called');
                     var result = response.getReturnValue();
            		 console.log('result',result);                           
                    //alert('Called');
                    
                }
                else{
                    console.log('Error');
                }
             
        	});
        $A.enqueueAction(action); 
	}
})