Code.require_file("pacman_rules.exs", __DIR__)
ExUnit.start()

defmodule PacmanRulesExamplesTest do
  use ExUnit.Case, async: true

  test "permite comer um fantasma com o poder ativo" do
    assert Rules.eat_ghost?(true, true) === true
  end

  test "marca pontos ao tocar um ponto" do
    assert Rules.score?(false, true) === true
  end

  test "perde ao tocar um fantasma sem poder" do
    assert Rules.lose?(false, true) === true
  end

  test "vence depois de comer todos os pontos" do
    assert Rules.win?(true, true, false) === true
  end
end
