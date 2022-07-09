public class AdyenClass {
    public static Map<String,Object> Authentication() {
        Http h = new Http();
        Map<String,Object> resbody = new Map<String,Object>();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://checkout-test.adyen.com/checkout/v69/paymentMethods');
        request.setHeader('X-API-Key', 'AQElhmfuXNWTK0Qc+iSDhnE8ouqPEN4cE5U0fAfbq52yNc2DBekpKRDBXVsNvuR83LVYjEgiTGAH-P7OcAQiK6S0piCF2Q91dSJ4AMv4TXQlqclEpqfXCcg4=-4252VUnZuHS{;9uZ');
        request.setHeader('Content-Type', 'application/json');
        String body = '{"merchantAccount": "Student851POS"}';
        request.setBody(body);
        HttpResponse response = h.send(request);
        if(response.getStatusCode() == 200){
            resbody = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        }
        return resbody;
    }
}
