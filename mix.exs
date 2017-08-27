defmodule BadSeed.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bad_seed,
      version: "0.1.0",
      elixirc_paths: elixirc_paths(Mix.env)
    ]
  end

  def elixirc_paths(:test), do: ~w(lib test/support)
  def elixirc_paths(_), do: ~w(lib)
end
