defmodule HelloWeb.HelloHTML do
  use HelloWeb, :html

  # Uso o mesmo template de saudação para português e inglês.
  embed_templates "hello_html/*"
end
