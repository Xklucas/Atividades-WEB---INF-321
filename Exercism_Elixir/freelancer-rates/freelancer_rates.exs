defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(price, discount) do
    price * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_price = daily_rate(hourly_rate) * 22
    ceil(apply_discount(monthly_price, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_price = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / daily_price, 1)
  end
end
