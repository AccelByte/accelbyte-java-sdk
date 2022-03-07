/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.client;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.json.JsonMapper;

import org.apache.commons.io.IOUtils;

import net.accelbyte.sdk.core.Header;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.logging.HttpLogger;
import okhttp3.FormBody;
import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.OkHttpClient.Builder;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Objects;

public class OkhttpClient implements HttpClient<HttpLogger<Request, Response>> {
    private static final OkHttpClient client = new OkHttpClient.Builder()
            .followRedirects(false)
            .build();

    private HttpLogger<Request, Response> logger = null;

    private static boolean isMediaTypeJson(String mediaType) {
        if (mediaType.equals("application/json")) {
            return true;
        }
        return mediaType.startsWith("application/") && mediaType.endsWith("+json");
    }

    @Override
    public HttpResponse sendRequest(Operation operation, String baseURL, Header header)
            throws IllegalArgumentException, IOException, JsonProcessingException {
        if (operation == null) {
            throw new IllegalArgumentException("Operation cannot be null");
        }

        if (baseURL == null || baseURL.isEmpty()) {
            throw new IllegalArgumentException("Base URL cannot be null or empty");
        }

        if (header == null) {
            throw new IllegalArgumentException("Header cannot be null");
        }

        String contentType = "application/json";

        if (!operation.getConsumes().isEmpty()) {
            contentType = operation.getConsumes().get(0);
            header.addHeaderData("Content-Type", operation.getConsumes().get(0));
        }

        Headers headers = Headers.of(header.getHeaderData());
        Request.Builder requestBuilder = new Request.Builder()
                .url(operation.getFullUrl(baseURL))
                .headers(headers);

        RequestBody requestBody = RequestBody.create(new byte[0]);

        if (!operation.getMethod().equals("GET")) {
            requestBuilder.method(operation.getMethod(), requestBody);
        }

        if (operation.getBodyParams() != null) {
            JsonMapper mapper = new JsonMapper();
            String json = mapper.writeValueAsString(operation.getBodyParams());
            if (isMediaTypeJson(contentType)) {
                requestBuilder.method(operation.getMethod(),
                        RequestBody.create(json, MediaType.get(contentType)));
            } else {
                requestBuilder.method(operation.getMethod(),
                        RequestBody.create(operation.getBodyParams().toString(),
                                MediaType.get(contentType)));
            }
        }

        if (operation.getFormDataParams() != null && !operation.getFormDataParams().isEmpty()) {
            if (operation.getConsumes().get(0).equals("multipart/form-data")) {
                MultipartBody.Builder builder = new MultipartBody.Builder().setType(MultipartBody.FORM);
                int filename = 0;
                for (Map.Entry<String, ?> entry : operation.getFormDataParams().entrySet()) {
                    if (entry.getValue() != null) {
                        if (entry.getValue() instanceof InputStream) {
                            requestBody = RequestBody.create(IOUtils.toByteArray((InputStream) entry.getValue()));
                            builder.addFormDataPart(entry.getKey(), String.valueOf(++filename), requestBody);
                        } else if (entry.getValue() instanceof String) {
                            builder.addFormDataPart(entry.getKey(), (String) entry.getValue());
                        } else {
                            builder.addFormDataPart(entry.getKey(), entry.getValue().toString());
                        }
                    }
                }
                requestBuilder.method(operation.getMethod(), builder.build());
            } else {
                FormBody.Builder builder = new FormBody.Builder();
                for (Map.Entry<String, ?> entry : operation.getFormDataParams().entrySet()) {
                    if (entry.getValue() != null) {
                        builder.add(entry.getKey(), (String) entry.getValue());
                    }
                }
                requestBuilder.method(operation.getMethod(), builder.build());
            }
        }

        Request request = requestBuilder.build();

        Builder builder = client.newBuilder();

        if (logger != null) {
            builder = builder.addNetworkInterceptor(new Interceptor() {
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

        OkHttpClient okHttpClient = builder.build();
        Response response = okHttpClient.newCall(request).execute();

        InputStream payload = null;

        if (response.isRedirect()) {
            byte[] responseHeader = Objects
                    .requireNonNull(response.header("Location"))
                    .getBytes(StandardCharsets.UTF_8);
            payload = new ByteArrayInputStream(responseHeader);
            return new HttpResponse(response.code(), contentType, payload);
        }

        if (response.body() != null) {
            contentType = String.valueOf(Objects.requireNonNull(response.body()).contentType());
            payload = Objects.requireNonNull(response.body()).byteStream();
        }

        return new HttpResponse(response.code(), contentType, payload);
    }

    @Override
    public void setLogger(HttpLogger<Request, Response> logger) {
        this.logger = logger;
    }
}