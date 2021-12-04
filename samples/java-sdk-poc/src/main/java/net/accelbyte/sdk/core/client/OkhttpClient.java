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
import java.util.Objects;

public class OkhttpClient implements HttpClient {
    // TODO: create abstraction so the implementation of httpclient much simpler
    @Override
    public HttpResponse sendRequest(Operation operation, String baseURL, Header header) throws IOException {
        String contentType = header.getHeaderData().get("Content-Type");
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
        } else if (operation.getFormDataParams() != null) {
            MultipartBody.Builder multipartBodyBuilder = new MultipartBody.Builder()
                    .setType(MultipartBody.FORM);
            operation.getFormDataParams().forEach(multipartBodyBuilder::addFormDataPart);
            requestBuilder.method(operation.getMethod(), multipartBodyBuilder.build());
        }
        Request request = requestBuilder.build();
        OkHttpClient okHttpClient = new OkHttpClient().newBuilder()
                .followRedirects(false).build();
        InputStream payload = null;
        Response response = okHttpClient.newCall(request).execute();
        ResponseBody responseBody = response.body();
        if (response.isRedirect()) {
            byte[] responseHeader = Objects.requireNonNull(response.header("Location")).getBytes();
            payload = new ByteArrayInputStream(responseHeader);
            return new HttpResponse(response.code(), "Location", payload);
        }
        if (responseBody != null) {
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
