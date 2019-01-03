package pl.coderslab.converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Receiver;
import pl.coderslab.service.ReceiverService;

public class ReceiverConverter implements Converter<String, Receiver> {

    @Autowired
    ReceiverService receiverService;

    @Override
    public Receiver convert(String s) {
        return (Receiver) receiverService.findById(Long.parseLong(s));
    }
}
