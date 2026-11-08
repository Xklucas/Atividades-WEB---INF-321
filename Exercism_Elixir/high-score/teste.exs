Code.require_file("high_score.exs", __DIR__)
ExUnit.start()

defmodule HighScoreExamplesTest do
  use ExUnit.Case, async: true

  test "inicia o placar vazio" do
    assert HighScore.new() === %{}
  end

  test "adiciona um jogador com pontuação inicial zero" do
    assert HighScore.add_player(%{}, "Alice") === %{"Alice" => 0}
  end

  test "adiciona um jogador com a pontuação informada" do
    assert HighScore.add_player(%{"Alice" => 0}, "Bob", 10) === %{"Alice" => 0, "Bob" => 10}
  end

  test "remove um jogador" do
    assert HighScore.remove_player(%{"Alice" => 0, "Bob" => 10}, "Alice") === %{"Bob" => 10}
  end

  test "zera a pontuação de um jogador" do
    assert HighScore.reset_score(%{"Bob" => 10}, "Bob") === %{"Bob" => 0}
  end

  test "soma pontos à pontuação existente" do
    assert HighScore.update_score(%{"Bob" => 0}, "Bob", 5) === %{"Bob" => 5}
  end

  test "lista os jogadores do placar" do
    assert Enum.sort(HighScore.get_players(%{"Alice" => 0, "Bob" => 10})) === ["Alice", "Bob"]
  end
end
