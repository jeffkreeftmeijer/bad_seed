defmodule FileMock do
  def start_link(contents \\ nil) do
    Agent.start_link(fn -> contents end, name: __MODULE__)
  end

  def read(".bad_seed") do
    case Agent.get(__MODULE__, &(&1)) do
      nil -> {:error, :enoent}
      seed -> {:ok, seed}
    end
  end

  def write(".bad_seed", contents) do
    Agent.update(__MODULE__, fn(_) -> contents end)
  end
end
