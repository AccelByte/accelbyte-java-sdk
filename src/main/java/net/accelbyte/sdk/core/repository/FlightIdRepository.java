package net.accelbyte.sdk.core.repository;

import java.util.UUID;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class FlightIdRepository {

    private static volatile FlightIdRepository defaultInstance;
    private static final ReadWriteLock lock = new ReentrantReadWriteLock();

    public static FlightIdRepository getInstance() {
        if (defaultInstance == null) {
            lock.writeLock().lock();
            try {
                if (defaultInstance == null) {
                    defaultInstance = new FlightIdRepository();
                }
            } finally {
                lock.writeLock().unlock();
            }
        }
        return defaultInstance;
    }

    private String flightId;

    FlightIdRepository() {
        flightId = UUID.randomUUID().toString();
    }

    public void setFlightId(String flightId) {
        lock.writeLock().lock();
        try {
            this.flightId = flightId;
        } finally {
            lock.writeLock().unlock();
        }
    }

    public String getFlightId() {
        lock.readLock().lock();
        try {
            return flightId;
        } finally {
            lock.readLock().unlock();
        }
    }

}
