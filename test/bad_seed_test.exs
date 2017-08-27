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
  end
end
