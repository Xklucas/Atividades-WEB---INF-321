Code.require_file("kitchen_calculator.exs", __DIR__)
ExUnit.start()

defmodule KitchenCalculatorExamplesTest do
  use ExUnit.Case, async: true

  test "extrai o volume da tupla" do
    assert KitchenCalculator.get_volume({:cup, 2}) === 2
  end

  test "converte xícaras para mililitros" do
    assert KitchenCalculator.to_milliliter({:cup, 2}) === {:milliliter, 480}
  end

  test "converte mililitros para xícaras" do
    assert KitchenCalculator.from_milliliter({:milliliter, 480}, :cup) === {:cup, 2.0}
  end

  test "converte xícaras para colheres de sopa" do
    assert KitchenCalculator.convert({:cup, 2}, :tablespoon) === {:tablespoon, 32.0}
  end
end
