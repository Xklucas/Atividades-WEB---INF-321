Code.require_file("hello_world.exs", __DIR__)
ExUnit.start()

defmodule HelloWorldExamplesTest do
  use ExUnit.Case, async: true

  test "retorna a saudação" do
    assert HelloWorld.hello() === "Hello, World!"
  end
end
