package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Receiver;

public interface ReceiverRepository extends JpaRepository<Receiver,Long> {
    Receiver findReceiverById(Long id);
}
