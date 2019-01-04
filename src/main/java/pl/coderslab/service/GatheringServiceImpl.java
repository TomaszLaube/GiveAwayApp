package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Gathering;
import pl.coderslab.repository.GatheringRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class GatheringServiceImpl implements GatheringService<Gathering> {

    @Autowired
    GatheringRepository gatheringRepository;

    @Override
    public void save(Gathering gathering) {
        gatheringRepository.save(gathering);
    }

    @Override
    public void edit(Gathering gathering) {
        gatheringRepository.save(gathering);
    }

    @Override
    public Gathering findById(Long id) {
        return gatheringRepository.findGatheringById(id);
    }

    @Override
    public List<Gathering> findAll() {
        return gatheringRepository.findAll();
    }
}
