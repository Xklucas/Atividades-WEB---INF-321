defmodule BirdCount do
  def today([]), do: nil
  def today([count | _rest]), do: count

  def increment_day_count([]), do: [1]
  def increment_day_count([count | rest]), do: [count + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _rest]), do: true
  def has_day_without_birds?([_count | rest]), do: has_day_without_birds?(rest)

  def total([]), do: 0
  def total([count | rest]), do: count + total(rest)

  def busy_days([]), do: 0
  def busy_days([count | rest]) when count >= 5, do: 1 + busy_days(rest)
  def busy_days([_count | rest]), do: busy_days(rest)
end
