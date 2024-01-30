package net.accelbyte.sdk.utils;

import java.lang.reflect.Field;
import java.util.Map;

public class EnvVarTestUtils {
    @SuppressWarnings("unchecked")
    public static void setEnvironmentVariable(String key, String value) throws NoSuchFieldException, IllegalAccessException {
        Map<String, String> env = System.getenv();
        Class<?> cl = env.getClass();
        Field field = cl.getDeclaredField("m");
        field.setAccessible(true);
        Map<String, String> writableEnv = (Map<String, String>) field.get(env);
        writableEnv.put(key, value);
    }

    @SuppressWarnings("unchecked")
    public static void removeEnvironmentVariable(String key) throws NoSuchFieldException, IllegalAccessException {
        Map<String, String> env = System.getenv();
        Class<?> cl = env.getClass();
        Field field = cl.getDeclaredField("m");
        field.setAccessible(true);
        Map<String, String> writableEnv = (Map<String, String>) field.get(env);
        writableEnv.remove(key);
    }
}
