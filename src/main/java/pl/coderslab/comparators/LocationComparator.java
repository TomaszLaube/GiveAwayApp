package pl.coderslab.comparators;

import pl.coderslab.model.Location;

import java.util.Comparator;

public class LocationComparator implements Comparator<Location> {
    @Override
    public int compare(Location l1, Location l2) {
        return l1.getName().compareTo(l2.getName());
    }
}
