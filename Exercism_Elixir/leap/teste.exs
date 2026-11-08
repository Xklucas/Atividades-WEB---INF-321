Code.require_file("year.exs", __DIR__)
ExUnit.start()

defmodule LeapExamplesTest do
  use ExUnit.Case, async: true

  test "reconhece 2020 como bissexto" do
    assert Year.leap_year?(2020) === true
  end

  test "reconhece 1900 como ano comum" do
    assert Year.leap_year?(1900) === false
  end

  test "reconhece 2000 como bissexto" do
    assert Year.leap_year?(2000) === true
  end
end
