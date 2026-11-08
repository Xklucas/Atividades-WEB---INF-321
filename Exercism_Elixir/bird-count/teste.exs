Code.require_file("bird_count.exs", __DIR__)
ExUnit.start()

defmodule BirdCountExamplesTest do
  use ExUnit.Case, async: true

  test "retorna a contagem de hoje" do
    assert BirdCount.today([0, 2, 5, 3, 7]) === 0
  end

  test "incrementa apenas a contagem de hoje" do
    assert BirdCount.increment_day_count([0, 2, 5, 3, 7]) === [1, 2, 5, 3, 7]
  end

  test "encontra um dia sem pássaros" do
    assert BirdCount.has_day_without_birds?([0, 2, 5, 3, 7]) === true
  end

  test "soma as contagens de todos os dias" do
    assert BirdCount.total([0, 2, 5, 3, 7]) === 17
  end

  test "conta os dias com pelo menos cinco pássaros" do
    assert BirdCount.busy_days([0, 2, 5, 3, 7]) === 2
  end
end
