defmodule BadSeed do
  @file_module Application.get_env(:bad_seed, :file_module, File)
  @system_module Application.get_env(:bad_seed, :system_module, System)

  def setup do
    case @file_module.read(seed_file_path()) do
      {:ok, seed} -> ExUnit.configure(seed: seed |> String.to_integer)
      _ -> :ok
    end

    @system_module.at_exit(&write_or_delete_seed_file/1)
    :ok
  end

  def write_or_delete_seed_file(0) do
    @file_module.rm(seed_file_path())
  end
  def write_or_delete_seed_file(_) do
    @file_module.write(seed_file_path(), ExUnit.configuration()[:seed] |> to_string)
  end

  defp seed_file_path do
    "_build/test/.bad_seed"
  end
end
