package net.accelbyte.sdk.cli.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CLIHelper {
  private CLIHelper() {}

  public static String getLobbyWsMessageType(String message) {
    Pattern p = Pattern.compile("(?<=type: )[^.\\s]*");
    Matcher m = p.matcher(message);
    if (m.find()) {
      return m.group();
    } else {
      throw new IllegalArgumentException("message doesn't have type");
    }
  }

  public static String getResponseTypeOf(String requestType) {
    Pattern requestPattern = Pattern.compile("Request$");
    Pattern notifPattern = Pattern.compile("Notif$");
    Matcher requestMatcher = requestPattern.matcher(requestType);
    Matcher notifMatcher = notifPattern.matcher(requestType);
    boolean request = requestMatcher.find();
    boolean notif = notifMatcher.find();
    if (request) {
      return requestType.replace("Request", "Response");
    } else if (notif) {
      return requestType;
    } else {
      throw new IllegalArgumentException("Invalid response type");
    }
  }
}
