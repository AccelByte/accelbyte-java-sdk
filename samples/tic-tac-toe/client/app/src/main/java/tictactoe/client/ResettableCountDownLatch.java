package tictactoe.client;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.locks.ReentrantLock;

public class ResettableCountDownLatch {
  final ReentrantLock lock = new ReentrantLock();

  CountDownLatch signal = new CountDownLatch(1);

  public void countDown() {
    lock.lock();
    try {
      signal.countDown();
    } finally {
      lock.unlock();
    }
  }

  public void await() throws InterruptedException {
    lock.lock();
    lock.unlock();
    signal.await();
  }

  public void Reset() {
    lock.lock();
    try {
      signal.countDown();
      signal = new CountDownLatch(1);
    } finally {
      lock.unlock();
    }
  }
}
