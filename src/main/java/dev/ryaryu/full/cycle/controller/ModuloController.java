package dev.ryaryu.full.cycle.controller;

import dev.ryaryu.full.cycle.repository.ModuloRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ModuloController {

  private final ModuloRepository repository;

  @GetMapping
  public String carregarModulos(Model model) {
    model.addAttribute("modulos", repository.findAll());
    return "modulos";
  }

}
