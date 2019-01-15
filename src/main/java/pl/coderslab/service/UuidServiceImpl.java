package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.repository.UuidRepository;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;
@Service
@Transactional
public class UuidServiceImpl implements UuidService<pl.coderslab.model.UUID> {

    @Autowired
    UuidRepository uuidRepository;

    @Override
    public void save(pl.coderslab.model.UUID uuid) {
        Date currentDate = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        c.add(Calendar.HOUR,72);
        Date uuidDate = c.getTime();
        uuid.setRegExpiry(new Timestamp(uuidDate.getTime()));
        uuid.setPwdExpiry(new Timestamp(uuidDate.getTime()));
        uuidRepository.save(uuid);
    }

    @Override
    public void edit(pl.coderslab.model.UUID uuid) {
        Date currentDate = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        c.add(Calendar.HOUR,72);
        Date uuidDate = c.getTime();
        uuid.setPwdExpiry(new Timestamp(uuidDate.getTime()));
        uuidRepository.save(uuid);
    }

    @Override
    public pl.coderslab.model.UUID findByRegUUID(UUID uuid) {
        return uuidRepository.findByRegUUID(uuid);
    }

    @Override
    public pl.coderslab.model.UUID findByPwdUUID(UUID uuid) {
        return uuidRepository.findByPwdUUID(uuid);
    }

    @Override
    public pl.coderslab.model.UUID findByUserId(Long userId) {
        return uuidRepository.findByUserId(userId);
    }
}
