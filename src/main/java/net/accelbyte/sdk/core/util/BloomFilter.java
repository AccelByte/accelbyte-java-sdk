package net.accelbyte.sdk.core.util;

import com.google.common.base.Charsets;
import com.google.common.hash.Funnel;
import com.google.common.hash.Hashing;
import com.google.common.primitives.Longs;

public class BloomFilter {
  public boolean mightContain(
      String object, int numHashFunctions, java.util.BitSet bits, long bitSize) {
    final byte[] bytes =
        Hashing.murmur3_128()
            .hashObject(
                object, (Funnel<String>) (from, into) -> into.putString(from, Charsets.UTF_8))
            .asBytes();
    final long hash1 = lowerEight(bytes);
    final long hash2 = upperEight(bytes);

    long combinedHash = hash1;
    for (int i = 0; i < numHashFunctions; i++) {
      if (!bits.get((int) ((combinedHash & Long.MAX_VALUE) % bitSize))) {
        return false;
      }
      combinedHash += hash2;
    }
    return true;
  }

  private long lowerEight(byte[] bytes) {
    return Longs.fromBytes(
        bytes[7], bytes[6], bytes[5], bytes[4], bytes[3], bytes[2], bytes[1], bytes[0]);
  }

  private long upperEight(byte[] bytes) {
    return Longs.fromBytes(
        bytes[15], bytes[14], bytes[13], bytes[12], bytes[11], bytes[10], bytes[9], bytes[8]);
  }
}
