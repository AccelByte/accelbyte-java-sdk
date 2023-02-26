package awslambdaexample;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPResponse;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.HashMap;
import java.util.Map;
import net.accelbyte.sdk.api.social.models.UserStatItemPagingSlicedResult;
import net.accelbyte.sdk.api.social.operations.user_statistic.CreateUserStatItem;
import net.accelbyte.sdk.api.social.operations.user_statistic.DeleteUserStatItems;
import net.accelbyte.sdk.api.social.operations.user_statistic.GetUserStatItems;
import net.accelbyte.sdk.api.social.wrappers.UserStatistic;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

/** Handler for requests to Lambda function. */
public class App implements RequestHandler<APIGatewayV2HTTPEvent, APIGatewayV2HTTPResponse> {
  final OkhttpClient httpClient = new OkhttpClient();
  final TokenRepository tokenRepo = DefaultTokenRepository.getInstance();
  final ConfigRepository configRepo = new DefaultConfigRepository();

  public APIGatewayV2HTTPResponse handleRequest(
      final APIGatewayV2HTTPEvent request, final Context context) {
    final Map<String, String> headers = new HashMap<>();
    headers.put("Content-Type", "application/json");

    try {
      final String baseUrl = configRepo.getBaseURL();
      final String clientId = configRepo.getClientId(); // Use confidential client ID
      final String clientSecret = configRepo.getClientSecret();

      if (baseUrl == null || baseUrl.equals("")) {
        throw new IllegalArgumentException("Missing config base URL");
      }

      if (clientId == null || clientId.equals("")) {
        throw new IllegalArgumentException("Missing config client ID");
      }

      if (clientSecret == null || clientSecret.equals("")) {
        throw new IllegalArgumentException("Missing config client secret");
      }

      final AccelByteSDK sdk = new AccelByteSDK(httpClient, tokenRepo, configRepo);

      switch (request.getRequestContext().getHttp().getMethod()) {
        case "POST":
          return handlePostRequest(sdk, request, headers);
        case "GET":
          return handleGetRequest(sdk, request, headers);
        case "DELETE":
          return handleDeleteRequest(sdk, request, headers);
        default:
          throw new IllegalArgumentException(
              String.format(
                  "Unhandled HTTP method %s", request.getRequestContext().getHttp().getMethod()));
      }
    } catch (HttpResponseException rex) {
      return APIGatewayV2HTTPResponse.builder()
          .withHeaders(headers)
          .withStatusCode(rex.getHttpCode())
          .withBody(rex.getErrorMessage())
          .build();

    } catch (Exception ex) {
      ex.printStackTrace(); // View error on clouldWatch or during local testing
      return APIGatewayV2HTTPResponse.builder()
          .withHeaders(headers)
          .withStatusCode(500)
          .withBody(String.format("{\"code\":500,\"message\":\"%s\"}", ex.getMessage()))
          .build();
    }
  }

  public APIGatewayV2HTTPResponse handlePostRequest(
      final AccelByteSDK sdk, final APIGatewayV2HTTPEvent request, Map<String, String> headers)
      throws Exception {

    final String namespace = request.getQueryStringParameters().get("namespace");
    final String userId = request.getQueryStringParameters().get("userId");

    final ObjectMapper mapper = new ObjectMapper();

    final Map<String, String> body =
        mapper.readValue(request.getBody(), new TypeReference<Map<String, String>>() {});

    final String statCode = body.get("statCode");

    if (namespace == null || namespace.equals("")) {
      throw new IllegalArgumentException("Missing path parameter namespace");
    }

    if (userId == null || userId.equals("")) {
      throw new IllegalArgumentException("Missing path parameter userId");
    }

    if (statCode == null || statCode.equals("")) {
      throw new IllegalArgumentException("Missing path parameter statCode");
    }

    if (!sdk.loginClient()) {
      throw new IllegalAccessException(
          String.format(
              "Login client failed %s",
              sdk.getSdkConfiguration().getConfigRepository().getClientId()));
    }

    final UserStatistic wrapper = new UserStatistic(sdk);

    final CreateUserStatItem operation =
        CreateUserStatItem.builder().namespace(namespace).userId(userId).statCode(statCode).build();

    wrapper.createUserStatItem(operation);

    return APIGatewayV2HTTPResponse.builder()
        .withHeaders(headers)
        .withStatusCode(200)
        .withBody("{\"Status\": \"successful\"}")
        .build();
  }

  public APIGatewayV2HTTPResponse handleGetRequest(
      final AccelByteSDK sdk, final APIGatewayV2HTTPEvent request, Map<String, String> headers)
      throws Exception {

    final String namespace = request.getQueryStringParameters().get("namespace");
    final String userId = request.getQueryStringParameters().get("userId");
    final String statCodes =
        request.getQueryStringParameters().get("statCodes") != null
            ? request.getQueryStringParameters().get("statCodes")
            : null;

    if (namespace == null || namespace.equals("")) {
      throw new IllegalArgumentException("Missing path parameter namespace");
    }

    if (userId == null || userId.equals("")) {
      throw new IllegalArgumentException("Missing path parameter userId");
    }

    if (!sdk.loginClient()) {
      throw new IllegalAccessException(
          String.format(
              "Login client failed %s",
              sdk.getSdkConfiguration().getConfigRepository().getClientId()));
    }

    final UserStatistic wrapper = new UserStatistic(sdk);

    final GetUserStatItems operation =
        GetUserStatItems.builder().namespace(namespace).userId(userId).statCodes(statCodes).build();

    final UserStatItemPagingSlicedResult result = wrapper.getUserStatItems(operation);

    return APIGatewayV2HTTPResponse.builder()
        .withHeaders(headers)
        .withStatusCode(200)
        .withBody(result.toJson())
        .build();
  }

  public APIGatewayV2HTTPResponse handleDeleteRequest(
      final AccelByteSDK sdk, final APIGatewayV2HTTPEvent request, Map<String, String> headers)
      throws Exception {

    final String namespace = request.getQueryStringParameters().get("namespace");
    final String userId = request.getQueryStringParameters().get("userId");
    final String statCode = request.getQueryStringParameters().get("statCode");

    if (namespace == null || namespace.equals("")) {
      throw new IllegalArgumentException("Missing path parameter namespace");
    }

    if (userId == null || userId.equals("")) {
      throw new IllegalArgumentException("Missing path parameter userId");
    }

    if (statCode == null || statCode.equals("")) {
      throw new IllegalArgumentException("Missing path parameter statCode");
    }

    if (!sdk.loginClient()) {
      throw new IllegalAccessException(
          String.format(
              "Login client failed %s",
              sdk.getSdkConfiguration().getConfigRepository().getClientId()));
    }

    final UserStatistic wrapper = new UserStatistic(sdk);

    final DeleteUserStatItems operation =
        DeleteUserStatItems.builder()
            .namespace(namespace)
            .userId(userId)
            .statCode(statCode)
            .build();

    wrapper.deleteUserStatItems(operation);

    return APIGatewayV2HTTPResponse.builder()
        .withHeaders(headers)
        .withStatusCode(200)
        .withBody("{\"Status\": \"successful\"}")
        .build();
  }
}
