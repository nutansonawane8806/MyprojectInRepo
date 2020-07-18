Trigger Master_Detail on Detail_Object__c (Before Insert ,Before Update) {

    for( Detail_Object__c obj : Trigger.New){
        
       obj.Master_Object__r.Name = 'NRP';
        
        System.debug('Successfully');
    }
    
}