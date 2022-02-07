package net.accelbyte.sdk.core.client;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.json.JsonMapper;
import net.accelbyte.sdk.core.Header;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;
import okhttp3.*;
import org.apache.commons.io.IOUtils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Objects;

public class OkhttpClient implements HttpClient {

    private static final OkHttpClient okHttpClient = new OkHttpClient().newBuilder()
            .followRedirects(false).build();

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
            header.addHeaderData("Content-Type", operation.getConsumes().get(0));
            contentType = operation.getConsumes().get(0);
        }
        Headers headers = Headers.of(header.getHeaderData());
        Request.Builder requestBuilder = new Request.Builder()
                .url(operation.getFullUrl(baseURL))
                .headers(headers);
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
        if (operation.getFormDataParams() != null) {
            if (operation.getConsumes().get(0) != null && operation.getConsumes().get(0).equals("multipart/form-data")) {
                MultipartBody.Builder builder = new MultipartBody.Builder().setType(MultipartBody.FORM);
                int filename = 0;
                for (Map.Entry<String, ?> entry : operation.getFormDataParams().entrySet()) {
                    if (entry.getValue() != null) {
                        if (entry.getValue() instanceof InputStream) {
                            RequestBody requestBody = RequestBody.create(IOUtils.toByteArray((InputStream) entry.getValue()));
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
        // todo: make user can set timeout
        InputStream payload = null;
        Response response = okHttpClient.newCall(request).execute();
        if (response.isRedirect()) {
            byte[] responseHeader = Objects.requireNonNull(response.header("Location")).getBytes(StandardCharsets.UTF_8);
            payload = new ByteArrayInputStream(responseHeader);
            return new HttpResponse(response.code(), contentType, payload);
        }
        if (response.body() != null) {
            contentType = String.valueOf(Objects.requireNonNull(response.body()).contentType());
            payload = Objects.requireNonNull(response.body()).byteStream();
        }
        return new HttpResponse(response.code(), contentType, payload);
    }
}
