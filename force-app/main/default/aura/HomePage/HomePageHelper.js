({
	InquiryFormOpenhelper : function( component, event, helper ) {
		
       var action = component.get('c.getCustomer');
        
       action.setCallback(this, function(response) {

        console.log('setCallback');    
        var state = response.getState();
        console.log('state',state);     
        console.log('action');
                    
            if (state === "SUCCESS") { 
                
                var result = response.getReturnValue();
                console.log('invoked Successfully');
                
                var ProductList1 = result.ProductList;
                console.log('ProductList1 List',ProductList1);
				var custList1 = result.CustomerList;
                console.log('custList1',custList1);
                
                var tempcustArray = [];
                      
                 for(var i=0; i<custList1.length; i++)
                 {
                     
                     tempcustArray.push(custList1[i].CustName);
                 }
                
                 var tempcustArray1 = [];
                      
                 for(var j=0; j<ProductList1.length; j++)
                 {
                     
                     tempcustArray1.push(ProductList1[i].ProductName);
                 }
                console.log('tempcustArray1',tempcustArray1);
                
                	var target = event.getSource();     
                    var modalBody;
                   
                $A.createComponent("c:InquiryForm",{ CustomerList : tempcustArray, ProductList : tempcustArray1 },
            
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
            else{
                console.log('Error');
            }           
        });              
   	$A.enqueueAction(action); 
}
	
})