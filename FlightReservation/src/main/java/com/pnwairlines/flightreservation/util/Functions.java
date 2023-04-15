package com.pnwairlines.flightreservation.util;

public class Functions {
    public static String formatDuration(int durationInSeconds) {
        int hours = durationInSeconds / 3600;
        int minutes = (durationInSeconds % 3600) / 60;

        return String.format("%dh %02dm", hours, minutes);
    }
}
