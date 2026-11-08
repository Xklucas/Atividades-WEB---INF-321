Code.require_file("guessing_game.exs", __DIR__)
ExUnit.start()

defmodule GuessingGameExamplesTest do
  use ExUnit.Case, async: true

  test "pede um palpite quando ele não foi informado" do
    assert GuessingGame.compare(5) === "Make a guess"
  end

  test "reconhece o palpite correto" do
    assert GuessingGame.compare(5, 5) === "Correct"
  end

  test "avisa quando o palpite está um abaixo" do
    assert GuessingGame.compare(5, 4) === "So close"
  end

  test "avisa quando o palpite está um acima" do
    assert GuessingGame.compare(5, 6) === "So close"
  end

  test "avisa quando o palpite é alto demais" do
    assert GuessingGame.compare(5, 7) === "Too high"
  end

  test "avisa quando o palpite é baixo demais" do
    assert GuessingGame.compare(5, 3) === "Too low"
  end
end
