package awslambdaexample;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;
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
public class App
    implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {
  final OkhttpClient httpClient = new OkhttpClient();
  final TokenRepository tokenRepo = DefaultTokenRepository.getInstance();
  final ConfigRepository configRepo = new DefaultConfigRepository();

  public APIGatewayProxyResponseEvent handleRequest(
      final APIGatewayProxyRequestEvent request, final Context context) {
    final Map<String, String> headers = new HashMap<>();
    headers.put("Content-Type", "application/json");

    final APIGatewayProxyResponseEvent response =
        new APIGatewayProxyResponseEvent().withHeaders(headers);

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

      switch (request.getHttpMethod()) {
        case "POST":
          return handlePostRequest(sdk, request, response);
        case "GET":
          return handleGetRequest(sdk, request, response);
        case "DELETE":
          return handleDeleteRequest(sdk, request, response);
        default:
          throw new IllegalArgumentException(
              String.format("Unhandled HTTP method %s", request.getHttpMethod()));
      }
    } catch (HttpResponseException rex) {
      return response.withStatusCode(rex.getHttpCode()).withBody(rex.getErrorMessage());

    } catch (Exception ex) {
      return response
          .withStatusCode(500)
          .withBody(String.format("{\"code\":0,\"message\":\"%s\"}", ex.getMessage()));
    }
  }

  public APIGatewayProxyResponseEvent handlePostRequest(
      final AccelByteSDK sdk,
      final APIGatewayProxyRequestEvent request,
      final APIGatewayProxyResponseEvent response)
      throws Exception {

    final String namespace = request.getPathParameters().get("namespace");
    final String userId = request.getPathParameters().get("userId");

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

    return response.withStatusCode(200).withBody("{}");
  }

  public APIGatewayProxyResponseEvent handleGetRequest(
      final AccelByteSDK sdk,
      final APIGatewayProxyRequestEvent request,
      final APIGatewayProxyResponseEvent response)
      throws Exception {
    final String namespace = request.getPathParameters().get("namespace");
    final String userId = request.getPathParameters().get("userId");
    final String statCodes =
        request.getQueryStringParameters() != null
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

    return response.withStatusCode(200).withBody(result.toJson());
  }

  public APIGatewayProxyResponseEvent handleDeleteRequest(
      final AccelByteSDK sdk,
      final APIGatewayProxyRequestEvent request,
      final APIGatewayProxyResponseEvent response)
      throws Exception {
    final String namespace = request.getPathParameters().get("namespace");
    final String userId = request.getPathParameters().get("userId");
    final String statCode = request.getPathParameters().get("statCode");

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

    return response.withStatusCode(200).withBody("{}");
  }
}
