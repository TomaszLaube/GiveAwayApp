package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Receiver;
import pl.coderslab.repository.ReceiverRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ReceiverServiceImpl implements ReceiverService<Receiver> {

    @Autowired
    ReceiverRepository receiverRepository;

    @Override
    public void save(Receiver receiver) {
        receiverRepository.save(receiver);
    }

    @Override
    public Receiver findById(Long id) {
        return receiverRepository.findReceiverById(id);
    }

    @Override
    public List<Receiver> findAll() {
        return receiverRepository.findAll();
    }
}
