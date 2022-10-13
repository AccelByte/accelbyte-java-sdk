/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import com.fasterxml.jackson.databind.json.JsonMapper;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import net.accelbyte.sdk.core.HttpHeaders;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.logging.HttpLogger;
import okhttp3.FormBody;
import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.OkHttpClient.Builder;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

public class OkhttpClient implements HttpClient<HttpLogger<Request, Response>> {
  private static final OkHttpClient client =
      new OkHttpClient.Builder().followRedirects(false).build();

  private HttpLogger<Request, Response> logger = null;

  private static boolean isMediaTypeJson(String mediaType) {
    if (mediaType.equals("application/json")) {
      return true;
    }
    return mediaType.startsWith("application/") && mediaType.endsWith("+json");
  }

  private static Request createRequest(Operation operation, String baseURL, HttpHeaders headers)
      throws IOException {
    String requestContentType = "application/json"; // Default

    if (!operation.getConsumes().isEmpty()) {
      requestContentType = operation.getConsumes().get(0);
      headers.put(HttpHeaders.CONTENT_TYPE, requestContentType);
    }

    final Headers requestHeaders = Headers.of(headers);
    final String requestUrl = operation.getFullUrl(baseURL);
    final Request.Builder requestBuilder =
        new Request.Builder().url(requestUrl).headers(requestHeaders);

    final String method = operation.getMethod();

    if (!method.equals("GET")) {
      final Object bodyParams = operation.getBodyParams();
      final Map<String, ?> formDataParams = operation.getFormParams();

      RequestBody requestBody = RequestBody.create(new byte[0]); // Default

      if (bodyParams != null) {
        if (isMediaTypeJson(requestContentType)) {
          final JsonMapper jsonMapper = new JsonMapper();
          final String bodyParamsJson = jsonMapper.writeValueAsString(bodyParams);
          requestBody = RequestBody.create(bodyParamsJson, MediaType.get(requestContentType));
        } else {
          requestBody =
              RequestBody.create(bodyParams.toString(), MediaType.get(requestContentType));
        }
      } else if (formDataParams != null && !formDataParams.isEmpty()) {
        if (requestContentType.equals("multipart/form-data")) {
          MultipartBody.Builder multipartBuilder =
              new MultipartBody.Builder().setType(MultipartBody.FORM);
          int filename = 0;
          for (Map.Entry<String, ?> entry : formDataParams.entrySet()) {
            if (entry.getValue() != null) {
              if (entry.getValue() instanceof File) {
                multipartBuilder.addFormDataPart(
                    entry.getKey(),
                    String.valueOf(++filename),
                    RequestBody.create((File) entry.getValue(), null));
              } else if (entry.getValue() instanceof String) {
                multipartBuilder.addFormDataPart(entry.getKey(), (String) entry.getValue());
              } else {
                multipartBuilder.addFormDataPart(entry.getKey(), entry.getValue().toString());
              }
            }
          }
          requestBody = multipartBuilder.build();
        } else {
          FormBody.Builder formBuilder = new FormBody.Builder();
          for (Map.Entry<String, ?> entry : formDataParams.entrySet()) {
            if (entry.getValue() != null) {
              formBuilder.add(entry.getKey(), (String) entry.getValue());
            }
          }
          requestBody = formBuilder.build();
        }
      }

      requestBuilder.method(method, requestBody);
    }

    return requestBuilder.build();
  }

  private static HttpResponse createResponse(Response response) {
    String contentType = "application/json"; // Default
    InputStream payload = null;

    if (response.isRedirect()) {
      final String location = response.header("Location");
      if (location == null) {
        throw new IllegalArgumentException("Redirect response location header must not be null");
      }
      final byte[] locationBytes = location.getBytes(StandardCharsets.UTF_8);
      payload = new ByteArrayInputStream(locationBytes);
    } else {
      final ResponseBody body = response.body();
      if (body != null) {
        contentType = String.valueOf(body.contentType());
        payload = body.byteStream();
      }
    }

    return new HttpResponse(response.code(), contentType, payload);
  }

  @Override
  public HttpResponse sendRequest(Operation operation, String baseURL, HttpHeaders headers)
      throws Exception {
    return sendRequest(operation, baseURL, headers, 60000);
  }

  protected HttpResponse sendRequest(
      Operation operation, String baseURL, HttpHeaders headers, int callTimeoutMillis)
      throws Exception {
    Objects.requireNonNull(operation, "Operation must not be null");
    Objects.requireNonNull(baseURL, "Base URL must not be null");
    Objects.requireNonNull(headers, "Headers must not be null");

    if (baseURL.isEmpty()) {
      throw new IllegalArgumentException("Base URL must not be empty");
    }

    final Request request = createRequest(operation, baseURL, headers);

    Builder okHttpBuilder = client.newBuilder();

    if (logger != null) {
      okHttpBuilder =
          okHttpBuilder.addNetworkInterceptor(
              new Interceptor() {
                @Override
                public Response intercept(Chain chain) throws IOException {
                  Request request = chain.request();
                  logger.logRequest(request);
                  Response response = chain.proceed(request);
                  logger.logResponse(response);
                  return response;
                }
              });
    }

    final Response response =
        okHttpBuilder
            .callTimeout(callTimeoutMillis, TimeUnit.MILLISECONDS)
            .build()
            .newCall(request)
            .execute();

    return createResponse(response);
  }

  @Override
  public void setLogger(HttpLogger<Request, Response> logger) {
    this.logger = logger;
  }
}
