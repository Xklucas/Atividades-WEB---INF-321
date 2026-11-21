defmodule HelloWeb.HelloControllerTest do
  use HelloWeb.ConnCase, async: true

  test "a página inicial abre o exemplo em português", %{conn: conn} do
    assert conn |> get(~p"/") |> redirected_to() == ~p"/saudacao/pt/lucas"
  end

  test "saúda em português com o nome da rota", %{conn: conn} do
    html = conn |> get(~p"/saudacao/pt/#{"élisa"}") |> html_response(200)

    assert html =~ ~s(lang="pt-BR")
    assert html =~ "Olá, Élisa!"
  end

  test "saúda em inglês com o nome da rota", %{conn: conn} do
    html = conn |> get(~p"/saudacao/en/alex") |> html_response(200)

    assert html =~ ~s(lang="en")
    assert html =~ "Hello, Alex!"
  end

  test "responde com 404 para idiomas fora do exercício", %{conn: conn} do
    assert conn |> get(~p"/saudacao/es/lucas") |> html_response(404) =~ "Idioma indisponível"
  end
end
