package net.accelbyte.sdk.core.client;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.json.JsonMapper;
import net.accelbyte.sdk.core.Header;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.Operation;
import okhttp3.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Objects;

public class OkhttpClient implements HttpClient {

    @Override
    public HttpResponse sendRequest(Operation operation, String baseURL, Header header) throws IOException {
        String contentType = "";
        if (!operation.getConsumes().isEmpty()) {
            if (operation.getConsumes().get(0) != null) {
                header.addHeaderData("Content-Type", operation.getConsumes().get(0));
                contentType = operation.getConsumes().get(0);
            }
        }
        Headers headers = Headers.of(header.getHeaderData());
        Request.Builder requestBuilder = new Request.Builder()
                .url(operation.getFullUrl(baseURL))
                .headers(headers);
        if (operation.getBodyParams() != null) {
            JsonMapper mapper = new JsonMapper();
            String json = "";
            try {
                json = mapper.writeValueAsString(operation.getBodyParams());
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            if (isMimeType(contentType)) {
                requestBuilder.method(operation.getMethod(), RequestBody.create(json, MediaType.get(contentType)));
            } else {
                requestBuilder.method(operation.getMethod(), RequestBody.create(operation.getBodyParams().toString(), MediaType.get(contentType)));
            }
        }
        if (operation.getFormDataParams() != null) {
            FormBody.Builder formBody = new FormBody.Builder();
            for (Map.Entry<String, String> entry : operation.getFormDataParams().entrySet()) {
                if (entry.getValue() != null) {
                    formBody.add(entry.getKey(), entry.getValue());
                }
            }
            requestBuilder.method(operation.getMethod(), formBody.build());
        }
        Request request = requestBuilder.build();
        // todo: make user can set timeout
        OkHttpClient okHttpClient = new OkHttpClient().newBuilder()
                .followRedirects(false)
                .build();
        InputStream payload = null;
        Response response = okHttpClient.newCall(request).execute();
        if (response.isRedirect()) {
            byte[] responseHeader = Objects.requireNonNull(response.header("Location")).getBytes();
            payload = new ByteArrayInputStream(responseHeader);
            return new HttpResponse(response.code(), contentType, payload);
        }
        if (response.body() != null) {
            contentType = String.valueOf(Objects.requireNonNull(response.body()).contentType());
            payload = Objects.requireNonNull(response.body()).byteStream();
        }
        return new HttpResponse(response.code(), contentType, payload);
    }

    public boolean isMimeType(String mimeType) {
        if (mimeType == null) {
            return false;
        }
        String[] split = mimeType.split("/");
        if (split.length != 2) {
            return false;
        }
        String main = split[0];
        String sub = split[1];
        return main.equals("application") && (sub.equals("json") || sub.endsWith("+json"));
    }
}
