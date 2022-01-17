package net.accelbyte.sdk;

import net.accelbyte.sdk.api.lobby.ws_models.JoinDefaultChannelResponse;
import net.accelbyte.sdk.core.util.Helper;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.jetbrains.annotations.NotNull;

import java.util.Map;

// this class would be implemented by user
public class Listener extends WebSocketListener {

    @Override
    public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
        Map<String, String> parsedMessage = Helper.parseWSM(text);
        String wsmType = Helper.getWSMType(parsedMessage);

        // filter message by type
        if (wsmType.equals(JoinDefaultChannelResponse.getType())) {

            // create Object
            JoinDefaultChannelResponse response = JoinDefaultChannelResponse.createFromWSM(text);

            // print out Object's field
            System.out.println(response.getCode());
            System.out.println(response.getChannelSlug());
            System.out.println(response.getId());
        }
    }

    @Override
    public void onClosed(@NotNull WebSocket webSocket, int code, @NotNull String reason) {
        System.out.println(code);
        System.out.println(reason);
    }
}
