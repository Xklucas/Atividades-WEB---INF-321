defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: ~p"/saudacao/pt/lucas")
  end

  # Uso pattern matching no cabeçalho para identificar o idioma e extrair o nome.
  def saudacao(conn, %{"lang" => "pt", "name" => name}) do
    render(conn, :saudacao, lang: "pt-BR", greeting: "Olá", name: String.capitalize(name))
  end

  def saudacao(conn, %{"lang" => "en", "name" => name}) do
    render(conn, :saudacao, lang: "en", greeting: "Hello", name: String.capitalize(name))
  end

  # Deixo a cláusula genérica por último para retornar 404 nos demais idiomas.
  def saudacao(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(:idioma_indisponivel, page_title: "Idioma indisponível")
  end
end
