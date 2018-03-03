defmodule TrippingException do

  def toJSON(exception) do
    exception
    |> encode_stacktrace
    |> Poison.encode!( pretty: true )
  end

  defp encode_stacktrace(exception) do
    stack_as_array_of_strings = elem(exception.original.stack, 1)
    |> Enum.slice( 2..-1 )
    |> Exception.format_stacktrace()
    |> String.split("\n")

    Map.update!(exception, :original, &(Map.update!(&1, :stack, fn _ -> stack_as_array_of_strings end)) )
  end

end