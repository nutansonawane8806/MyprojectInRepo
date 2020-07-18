({
	FollowupisChecked : function(component, event, helper) {
	   component.set('v.FollowupChecked',true);
        
        var valueOfFilterProj = component.find('FilterProj').get('v.value');
        if( valueOfFilterProj == false){
            
            component.set('v.DisclaimerValue',true);
            component.set('v.FollowupChecked',true);
        }
        else{
            
            component.set('v.DisclaimerValue',false);
            component.set('v.FollowupChecked',false);
        }
	         
        
	},
    handleSubmit : function(component, event, helper) {
      
        console.log('handleSubmit method');
        
        var allValid = component.find('fieldId').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && !inputCmp.get('v.validity').valueMissing;
        }, true);
         
     if (allValid) {
        
       var Customer = component.find("Customer").get("v.value");
       var Status = component.find("Status").get("v.value");
       var Product = component.find("Product").get("v.value");
       var Date = component.get('v.Date1');
       var Desc = component.get('v.Description');       
       var Followupdate = component.get('v.Followupdate');
       var Contact = component.get('v.ContactNo');
       var srcInq = component.get('v.srcInquiry');
       var Quotation = component.get('v.Quotation');
       var checkorNot = component.get('v.FollowupChecked');
                  
       var action = component.get('c.storeData');
       
       action.setParams({customerName : Customer, date1 : Date, Contact : Contact
                         ,srcIqry : srcInq, Product : Product, Quot : Quotation,
                         Status : Status, FollowupDate : Followupdate, Descr : Desc, CheckorNot :checkorNot }); 
       
        		console.log('Pameters setted');
                action.setCallback(this, function(response) {    
                console.log('setCallback');    
        		var state = response.getState();        
                if (state === "SUCCESS") { 
                                                   
                    console.log('SUCCESS');
                    alert('Entry added successfully');
                    
                }
                else{
                    console.log('Error');
                }
             
        	});
        	var popup = window.open(location, '_self', '');
        	popup.close();
    	 }
        else{
            
            alert('Enter Valid Data ');
        }
       
   	$A.enqueueAction(action); 
   
	},
    
    onChange : function(component, event, helper) {
       
       var custName = component.find("Customer").get("v.value");
       var action = component.get('c.getCustContactNo');
       action.setParams({customerName : custName}); 
       
        
       action.setCallback(this, function(response) {

        console.log('custName',custName);    
        var state = response.getState();
        console.log('state',state);     
        console.log('action');
                    
            if (state === "SUCCESS") { 
                
               var result = response.getReturnValue(); 
               var CustNo = result.ContactNo;
               console.log('CustNo',CustNo);
               
               component.set("v.ContactNo",CustNo);
            }
            else{
                console.log('Error');
            }           
        });              
   	$A.enqueueAction(action); 
        
    },
    
   addCustomer : function(component, event, helper) {
       
        				var target = event.getSource();     
                        var modalBody;
                       
                    $A.createComponent( "c:addCustomer",{ },
                                              		                        
                        function(content, status) {
                
                            if (status === "SUCCESS") {
                
                                modalBody = content;
                
                                component.find('overlayLib').showCustomModal({
                
                                header: "Add New Customer",
                
                                body: modalBody,
                
                                showCloseButton: true,
                
                                cssClass: "mymodal",
                
                                closeCallback: function() {
                
                                console.log('method invoked successfully');
                                console.log('trial  from child',component.get('v.TrialInParent'));
                
                                }
                
                            })
                
                        }
                    });
   		},
    	addProduct : function(component, event, helper) {
       
        				var target = event.getSource();     
                        var modalBody;
                       
                    $A.createComponent("c:addProduct",{  },
                
                        function(content, status) {
                
                            if (status === "SUCCESS") {
                
                                modalBody = content;
                
                                component.find('overlayLib').showCustomModal({
                
                                header: "Add New Inquiry",
                
                                body: modalBody,
                
                                showCloseButton: true,
                
                                cssClass: "mymodal",
                
                                closeCallback: function() {
                
                                console.log('method invoked successfully');
                
                                }
                
                            })
                
                        }
                    });
   		}
})