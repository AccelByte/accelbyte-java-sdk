package net.accelbyte.sdk.core.validator;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserAuthContext {

  final String token;

  @Builder.Default String namespace = "";

  @Builder.Default String userId = "";
}
