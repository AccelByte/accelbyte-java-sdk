package awslambdaexample;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assume.assumeFalse;

import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPResponse;
import java.util.HashMap;
import java.util.Map;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.junit.Test;

public class AppTest {
  @Test
  public void successfulPostResponse() {
    final ConfigRepository configRepo = new DefaultConfigRepository();

    final String baseUrl = configRepo.getBaseURL();
    final String clientId = configRepo.getClientId(); // Use confidential client ID
    final String clientSecret = configRepo.getClientSecret();

    assumeFalse(baseUrl == null || baseUrl.equals(""));
    assumeFalse(clientId == null || clientId.equals(""));
    assumeFalse(clientSecret == null || clientSecret.equals(""));

    final App app = new App();

    // curl 'http://localhost:3000/user-stats/accelbyte/b284a13ac1ab4605aba444102fdb02a1' -d
    // '{"statCode":"testme"}'

    final Map<String, String> pathParameters = new HashMap<>();
    pathParameters.put("namespace", "accelbyte");
    pathParameters.put("userId", "b284a13ac1ab4605aba444102fdb02a1");

    APIGatewayV2HTTPEvent request = new APIGatewayV2HTTPEvent();
    request.getRequestContext().getHttp().setMethod("POST");
    request.setPathParameters(pathParameters);
    request.setBody("{\"statCode\":\"testme\"}");

    final APIGatewayV2HTTPResponse result = app.handleRequest(request, null);

    assertNotNull(result);
  }

  @Test
  public void successfulGetResponse() {
    final ConfigRepository configRepo = new DefaultConfigRepository();

    final String baseUrl = configRepo.getBaseURL();
    final String clientId = configRepo.getClientId(); // Use private client ID
    final String clientSecret = configRepo.getClientSecret();

    assumeFalse(baseUrl == null || baseUrl.equals(""));
    assumeFalse(clientId == null || clientId.equals(""));
    assumeFalse(clientSecret == null || clientSecret.equals(""));

    final App app = new App();

    // curl
    // 'http://localhost:3000/user-stats/accelbyte/b284a13ac1ab4605aba444102fdb02a1?statCodes=testme'

    final Map<String, String> pathParameters = new HashMap<>();
    pathParameters.put("namespace", "accelbyte");
    pathParameters.put("userId", "b284a13ac1ab4605aba444102fdb02a1");

    final Map<String, String> queryStringParameters = new HashMap<>();
    queryStringParameters.put("statCodes", "testme");

    APIGatewayV2HTTPEvent request = new APIGatewayV2HTTPEvent();
    request.getRequestContext().getHttp().setMethod("GET");
    request.setQueryStringParameters(pathParameters);
    request.setQueryStringParameters(queryStringParameters);

    final APIGatewayV2HTTPResponse result = app.handleRequest(request, null);

    assertNotNull(result);
  }

  @Test
  public void successfulDeleteResponse() {
    final ConfigRepository configRepo = new DefaultConfigRepository();

    final String baseUrl = configRepo.getBaseURL();
    final String clientId = configRepo.getClientId(); // Use private client ID
    final String clientSecret = configRepo.getClientSecret();

    assumeFalse(baseUrl == null || baseUrl.equals(""));
    assumeFalse(clientId == null || clientId.equals(""));
    assumeFalse(clientSecret == null || clientSecret.equals(""));

    final App app = new App();

    // curl -X DELETE
    // 'http://localhost:3000/user-stats/accelbyte/b284a13ac1ab4605aba444102fdb02a1/testme'

    final Map<String, String> pathParameters = new HashMap<>();
    pathParameters.put("namespace", "accelbyte");
    pathParameters.put("userId", "b284a13ac1ab4605aba444102fdb02a1");
    pathParameters.put("statCode", "testme");

    APIGatewayV2HTTPEvent request = new APIGatewayV2HTTPEvent();
    request.getRequestContext().getHttp().setMethod("DELETE");
    request.setQueryStringParameters(pathParameters);

    final APIGatewayV2HTTPResponse result = app.handleRequest(request, null);

    assertNotNull(result);
  }
}
