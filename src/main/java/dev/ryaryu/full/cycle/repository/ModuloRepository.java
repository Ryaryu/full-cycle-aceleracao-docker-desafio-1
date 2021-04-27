package dev.ryaryu.full.cycle.repository;

import dev.ryaryu.full.cycle.model.Modulo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ModuloRepository extends CrudRepository<Modulo, Long> {

}
