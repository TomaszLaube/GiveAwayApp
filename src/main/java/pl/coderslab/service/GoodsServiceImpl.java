package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Goods;
import pl.coderslab.repository.GoodsRepository;

import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService<Goods> {

    @Autowired
    GoodsRepository goodsRepository;

    @Override
    public void save(Goods goods) {
        goodsRepository.save(goods);
    }

    @Override
    public void edit(Goods goods) {
        goodsRepository.save(goods);
    }

    @Override
    public void delete(Goods goods) {
        goodsRepository.delete(goods);
    }

    @Override
    public Goods findByName(String name) {
        return goodsRepository.findGoodsByNameIgnoreCase(name);
    }

    @Override
    public Goods findById(Long id) {
        return goodsRepository.findGoodsById(id);
    }

    @Override
    public List<Goods> findAll() {
        return goodsRepository.findAll();
    }
}
