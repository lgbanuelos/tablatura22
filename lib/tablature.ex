defmodule Tablature do
  def parse(tab) do

    tab
    |> String.split
    |> Enum.map(fn line -> parse_line(line) end)
    |> List.flatten()
    |> Enum.sort_by(fn {_c,p} -> p end)
    # |> Enum.map(fn e -> elem(e, 0) end)
    # |> Enum.join(" ")
    # |> String.trim()
    # |> Enum.filter(fn lista -> lista != [] end)
    # |> Enum.zip
    # |> Enum.map(fn tupla -> Tuple.to_list(tupla) end)
    # |> List.flatten()
    # |> Enum.join(" ")
  end

  def parse_line(line) do
    note = String.at(line, 0)

    line
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.filter(fn tupla -> elem(tupla, 0) =~ ~r/\d/ end)
    |> Enum.map(fn {c, p} -> {note <> c, p} end)


    # Regex.scan(~r/\d+/, line)
    # |> List.flatten
    # |> Enum.map(fn str -> note <> str end)
    # |> Enum.join(" ")
  end
end
