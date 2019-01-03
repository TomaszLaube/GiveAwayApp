package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Location;
import pl.coderslab.repository.LocationRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class LocationServiceImpl implements LocationService<Location> {

    @Autowired
    LocationRepository locationRepository;

    @Override
    public void save(Location location) {
        locationRepository.save(location);
    }

    @Override
    public void delete(Location location) {
        locationRepository.delete(location);
    }

    @Override
    public Location findById(Long id) {
        return locationRepository.findLocationById(id);
    }

    @Override
    public List<Location> findAll() {
        return locationRepository.findAll();
    }
}
