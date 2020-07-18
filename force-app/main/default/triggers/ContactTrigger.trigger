/**
 * Trigger for check contact acoount name
 * */


Trigger ContactTrigger on Contact ( Before Insert ) {
      
    for ( Contact Con : [Select Id, Name, Account.Name From Contact Where Id IN :Trigger.new] ){
        
        if ( Con.Account.Name != 'Nutan'){
            
            Trigger.newMap.get(Con.Id).addError('Your Account Is not NUTAN');
        }
     
        
    }

}