Code.require_file("language_list.exs", __DIR__)
ExUnit.start()

defmodule LanguageListExamplesTest do
  use ExUnit.Case, async: true

  test "cria uma lista vazia" do
    assert LanguageList.new() === []
  end

  test "adiciona uma linguagem ao início da lista" do
    assert LanguageList.add(["Elixir", "Ruby"], "Python") === ["Python", "Elixir", "Ruby"]
  end

  test "remove a primeira linguagem" do
    assert LanguageList.remove(["Elixir", "Ruby", "Python"]) === ["Ruby", "Python"]
  end

  test "retorna a primeira linguagem" do
    assert LanguageList.first(["Elixir", "Ruby", "Python"]) === "Elixir"
  end

  test "conta as linguagens da lista" do
    assert LanguageList.count(["Elixir", "Ruby", "Python"]) === 3
  end

  test "encontra Elixir na lista" do
    assert LanguageList.functional_list?(["Elixir", "Ruby", "Python"]) === true
  end
end
