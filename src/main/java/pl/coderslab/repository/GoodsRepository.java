package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Goods;

import java.util.List;

public interface GoodsRepository extends JpaRepository<Goods,Long> {
    Goods findGoodsById(Long id);
    Goods findGoodsByNameIgnoreCase(String name);
}
