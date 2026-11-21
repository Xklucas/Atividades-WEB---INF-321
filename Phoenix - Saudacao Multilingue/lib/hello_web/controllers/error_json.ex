defmodule HelloWeb.ErrorJSON do
  @moduledoc """
  Mantive a mensagem padrão do Phoenix para erros de requisições JSON.
  """

  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
