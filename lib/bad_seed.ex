defmodule BadSeed do
  @file_module Application.get_env(:bad_seed, :file_module, File)
  @system_module Application.get_env(:bad_seed, :system_module, System)

  def setup do
    case @file_module.read(".bad_seed") do
      {:ok, seed} -> ExUnit.configure(seed: seed |> String.to_integer)
      _ -> :ok
    end

    @system_module.at_exit(&write_or_delete_seed_file/1)
    :ok
  end

  def write_or_delete_seed_file(_) do
    @file_module.write(".bad_seed", ExUnit.configuration()[:seed] |> to_string)
  end
end
