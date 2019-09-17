defmodule ExZalgo do
  @moduledoc """
  Documentation for ExZalgo.
  """

  @zalgo_chars 0x0300..(0x036F + 1) |> Enum.to_list() |> Enum.concat([0x0488, 0x0489])

  defp forge_zalgo_char(char) do
    zalgo_string =
      0..:rand.uniform(10)
      |> Enum.map(fn _ -> Enum.take_random(@zalgo_chars, 1) end)
      |> List.flatten()

    Enum.concat([char], zalgo_string)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ExZalgo.zalgo("HELLO")
      "H̷̱͙͒͆̂̍͘ͅȄ̝L̮̝ͥL̨̢̼̝̄̍̃ͪỎ̷̜̋͠͡"

  """
  def zalgo(word) do
    word
    |> to_charlist
    |> Enum.map(&forge_zalgo_char/1)
    |> List.flatten()
    |> to_string
  end
end
