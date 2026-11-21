defmodule HelloWeb.ErrorHTML do
  @moduledoc """
  Mantive a mensagem padrão do Phoenix para erros de requisições HTML.
  """
  use HelloWeb, :html

  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
