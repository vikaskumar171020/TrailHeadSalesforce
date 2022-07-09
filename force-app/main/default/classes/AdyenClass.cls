public class AdyenClass {

    private static String Endpoint = 'https://checkout-test.adyen.com/checkout/v69/'; 
    private static List<String> HeaderValues = new List<String>{'application/json','AQElhmfuXNWTK0Qc+iSDhnE8ouqPEN4cE5U0fAfbq52yNc2DBekpKRDBXVsNvuR83LVYjEgiTGAH-P7OcAQiK6S0piCF2Q91dSJ4AMv4TXQlqclEpqfXCcg4=-4252VUnZuHS{;9uZ'};
    private static List<String> HeaderKeys = new List<String>{'Content-Type','X-API-Key'};
    private static List<String> Methods = new List<String>{'GET','POST','PUT','DELETE','PATCH'};


    public static HttpResponse Authentication() {
        Http h = new Http();
        Map<String,Object> resbody = new Map<String,Object>();
        HttpRequest request = new HttpRequest();
        request.setMethod(Methods[1]);
        request.setEndpoint(Endpoint+'paymentMethods');
        request.setHeader(HeaderKeys[0],HeaderValues[0]);
        request.setHeader(HeaderKeys[1],HeaderValues[1]);
        String body = '{"merchantAccount": "Student851POS"}';
        request.setBody(body);
        HttpResponse response = h.send(request);
        return response;
    }

    public static HttpResponse Payments() {
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod(Methods[1]);
        request.setEndpoint(Endpoint+'payments');
        request.setHeader(HeaderKeys[0], HeaderValues[0]);
        request.setHeader(HeaderKeys[1], HeaderValues[1]);
        String body = '{"amount": {"currency": "USD","value": 1000},"reference": "vikas","paymentMethod": {"type": "scheme","encryptedCardNumber": "test_4111111111111111","encryptedExpiryMonth": "test_03","encryptedExpiryYear": "test_2030","encryptedSecurityCode": "test_737"},"shopperInteraction":"Ecommerce","returnUrl": "https://your-company.com/","merchantAccount": "Student851POS"}';
        request.setBody(body);
        HttpResponse response = h.send(request);
        return response;
    }

    public static void JsonWrapper(HttpResponse response) {
        Map<String,Object> body = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        System.debug(body);
    }
}
