defmodule LanguageList do
  def new do
    []
  end

  def add(languages, language) do
    [language | languages]
  end

  def remove([_first | rest]) do
    rest
  end

  def first([first | _rest]) do
    first
  end

  def count(languages) do
    length(languages)
  end

  def functional_list?(languages) do
    "Elixir" in languages
  end
end
