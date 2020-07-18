public class APIExampleController {

    @AuraEnabled
    public static Decimal callAPI( Decimal Rs ){
       
        System.debug('Rs '+Rs);
        Decimal RsINR = 0.0;
        System.debug('1 ');
        HTTP h = new HTTP();
        System.debug('2 ');
        HTTPrequest req = new HTTPrequest();
        System.debug('3 ');
        
        req.setEndpoint('https://api.exchangeratesapi.io/latest');
        System.debug('4 ');
	  	req.setMethod('GET');
        System.debug('5 ');

		HTTPResponse res = h.send(req);
		System.debug('6 ');
		Map<String,Object> jsonBody = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
        System.debug('7 ');
        
        System.debug('jsonBody '+jsonBody);
        Map<String,Object> mMap = (Map<String,Object>) jsonBody.get('rates');
        
        Decimal conversionRate = (Decimal) mMap.get('INR');
        RsINR = Rs*conversionRate;
        
        return RsINR;
        
    }
}