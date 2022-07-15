package net.accelbyte.sdk.core;

import java.util.Arrays;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
class MockServerConfigureResponseOperation extends Operation {
  private String path = "/configure-overwrite-response";
  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");

  private MockServerResponseConfiguration body;

  @Override
  public MockServerResponseConfiguration getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }
}
