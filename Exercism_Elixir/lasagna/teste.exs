Code.require_file("lasagna.exs", __DIR__)
ExUnit.start()

defmodule LasagnaExamplesTest do
  use ExUnit.Case, async: true

  test "soma os tempos de preparo e de forno" do
    assert Lasagna.total_time_in_minutes(3, 20) === 26
  end

  test "retorna o aviso do alarme" do
    assert Lasagna.alarm() === "Ding!"
  end
end
