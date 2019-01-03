package pl.coderslab.converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Goods;
import pl.coderslab.service.GoodsService;

public class GoodsConverter implements Converter<String, Goods> {

    @Autowired
    GoodsService goodsService;


    @Override
    public Goods convert(String s) {
        return (Goods) goodsService.findById(Long.parseLong(s));
    }
}
