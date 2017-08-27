defmodule BadSeedTest do
  use ExUnit.Case

  describe "when .bad_seed exists" do
    setup do
      seed = Enum.random(0..999999)
      FileMock.start_link(seed |> to_string)

      %{seed: seed}
    end

    test "BadSeed.setup/0 overwrites the ExUnit seed", %{seed: seed} do
      :ok = BadSeed.setup()
      assert seed == ExUnit.configuration()[:seed]
    end

    test "BadSeed.write_or_delete_seed_file/1 removes .bad_seed when the test run passes" do
      BadSeed.write_or_delete_seed_file(0)
      assert {:error, :enoent} == FileMock.read(".bad_seed")
    end
  end

  describe "when .bad_seed does not exist" do
    setup do
      seed = ExUnit.configuration()[:seed]
      FileMock.start_link()

      %{seed: seed}
    end

    test "BadSeed.setup/0 does not overwrite the ExUnit seed", %{seed: seed} do
      :ok = BadSeed.setup()
      assert seed == ExUnit.configuration()[:seed]
    end

    test "BadSeed.write_or_delete_seed_file/1 creates .bad_seed when the test run fails", %{seed: seed} do
      BadSeed.write_or_delete_seed_file(1)
      assert {:ok, seed |> to_string} == FileMock.read(".bad_seed")
    end
  end
end
