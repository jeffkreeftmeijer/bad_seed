defmodule FileMock do
  def start_link(contents \\ nil) do
    Agent.start_link(fn -> contents end, name: __MODULE__)
  end

  def read("_build/test/.bad_seed") do
    case Agent.get(__MODULE__, &(&1)) do
      nil -> {:error, :enoent}
      seed -> {:ok, seed}
    end
  end

  def rm("_build/test/.bad_seed") do
    Agent.update(__MODULE__, fn(_) -> nil end)
    :ok
  end

  def write("_build/test/.bad_seed", contents) do
    Agent.update(__MODULE__, fn(_) -> contents end)
  end
end
