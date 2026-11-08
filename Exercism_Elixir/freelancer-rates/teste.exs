Code.require_file("freelancer_rates.exs", __DIR__)
ExUnit.start()

defmodule FreelancerRatesExamplesTest do
  use ExUnit.Case, async: true

  test "calcula o valor de oito horas de trabalho" do
    assert FreelancerRates.daily_rate(50) === 400.0
  end

  test "aplica o desconto ao preço" do
    assert FreelancerRates.apply_discount(1000, 20) === 800.0
  end

  test "calcula o valor mensal com desconto" do
    assert FreelancerRates.monthly_rate(50, 20) === 7040
  end

  test "calcula quantos dias cabem no orçamento" do
    assert FreelancerRates.days_in_budget(1000, 50, 20) === 3.1
  end
end
