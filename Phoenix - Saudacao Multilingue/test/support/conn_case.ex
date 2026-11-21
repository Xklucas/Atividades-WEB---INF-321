defmodule HelloWeb.ConnCase do
  @moduledoc """
  Uso `Phoenix.ConnTest` para preparar uma conexão para cada teste de rota.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      @endpoint HelloWeb.Endpoint

      use HelloWeb, :verified_routes

      import Plug.Conn
      import Phoenix.ConnTest
      import HelloWeb.ConnCase
    end
  end

  setup _tags do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
