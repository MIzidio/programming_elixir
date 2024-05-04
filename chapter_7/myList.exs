defmodule MyList do
  def map([], _func), do: []

  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  def reduce([], value, _func), do: value

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum([], _func), do: 0

  def mapsum([head | tail], func) do
    mapper = map([head | tail], func)
    reduce(mapper, 0, &(&1 + &2))
  end

  def max([]), do: -99_999_999

  def max([head | tail]) do
    if head > max(tail) do
      head
    else
      max(tail)
    end
  end
end
