defmodule BadSeed do
  @file_module Application.get_env(:bad_seed, :file_module, File)

  def setup do
    case @file_module.read(".bad_seed") do
      {:ok, seed} -> ExUnit.configure(seed: seed |> String.to_integer)
      _ -> :ok
    end
  end
end
