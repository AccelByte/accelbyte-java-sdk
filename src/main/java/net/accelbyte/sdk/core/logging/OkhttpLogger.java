/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.logging;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import kotlin.Pair;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Buffer;
import okio.BufferedSource;

public class OkhttpLogger implements HttpLogger<Request, Response> {
  private static final String LOG_FILE_PATH = "http_log.txt";

  @Override
  public void logRequest(Request request) {
    try {
      final FileOutputStream fos = new FileOutputStream(LOG_FILE_PATH, true);
      final OutputStreamWriter osw = new OutputStreamWriter(fos, StandardCharsets.UTF_8);
      BufferedWriter bw = null;

      try {
        bw = new BufferedWriter(osw);

        bw.write("--- request");
        bw.newLine();

        bw.write("url: " + request.url().toString());
        bw.newLine();
        bw.write("method: " + request.method().toString());
        bw.newLine();

        bw.write("headers:");
        bw.newLine();
        for (Pair<? extends String, ? extends String> p : request.headers()) {
          bw.write(" " + p.component1() + ": " + String.join(",", p.component2()));
          bw.newLine();
        }

        final Request copy = request.newBuilder().build();
        final RequestBody body = copy.body();

        if (body != null) {
          final MediaType type = body.contentType();
          final Buffer buffer = new Buffer();

          body.writeTo(buffer);

          if (type != null && type.equals(MediaType.parse("multipart/form-data"))) {
            String bEncoded = Base64.getEncoder().encodeToString(buffer.readByteArray());
            bw.write("body: !!binary |");
            bw.newLine();
            bw.write(bEncoded);
            bw.newLine();
          } else {
            bw.write("body: " + buffer.readUtf8());
            bw.newLine();
          }
        }

        long ts = System.currentTimeMillis();

        bw.write("timestamp: " + String.valueOf(ts));
        bw.newLine();

        bw.newLine();
      } finally {
        if (bw != null) {
          bw.close();
        }
      }
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }

  @Override
  public void logResponse(Response response) {
    long ts = System.currentTimeMillis();

    try {
      final FileOutputStream fos = new FileOutputStream(LOG_FILE_PATH, true);
      final OutputStreamWriter osw = new OutputStreamWriter(fos, StandardCharsets.UTF_8);
      BufferedWriter bw = null;

      try {
        bw = new BufferedWriter(osw);

        bw.write("--- response");
        bw.newLine();

        bw.write("url: " + response.request().url().toString());
        bw.newLine();
        bw.write("method: " + response.request().method().toString());
        bw.newLine();

        bw.write("headers:");
        bw.newLine();
        for (Pair<? extends String, ? extends String> p : response.headers()) {
          bw.write(" " + p.component1() + ": " + String.join(",", p.component2()));
          bw.newLine();
        }

        final ResponseBody body = response.body();
        final MediaType type = body.contentType();

        final BufferedSource source = body.source();
        source.request(Long.MAX_VALUE);
        final Buffer buffer = source.getBuffer().clone();

        if (type != null
            && (type.equals(MediaType.parse("application/json"))
                || type.equals(MediaType.parse("text/json"))
                || type.equals(MediaType.parse("text/plain")))) {
          bw.write("body: " + buffer.readUtf8());
          bw.newLine();
        } else {
          String bEncoded = Base64.getEncoder().encodeToString(buffer.readByteArray());
          bw.write("body: !!binary |");
          bw.newLine();
          bw.write(bEncoded);
          bw.newLine();
        }

        bw.write("timestamp: " + String.valueOf(ts));
        bw.newLine();

        bw.newLine();
      } finally {
        if (bw != null) {
          bw.close();
        }
      }
    } catch (IOException ioe) {
      ioe.printStackTrace();
    }
  }
}
