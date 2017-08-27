defmodule BadSeed.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bad_seed,
      version: "0.1.0",
      description: "Stores and reuses ExUnit seeds from failing test runs.",
      package: [
        maintainers: ["Jeff Kreeftmeijer"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/jeffkreeftmeijer/bad_seed"}
      ],
      elixirc_paths: elixirc_paths(Mix.env),
      deps: [{:ex_doc, "~> 0.16", only: :dev, runtime: false}]
    ]
  end

  def elixirc_paths(:test), do: ~w(lib test/support)
  def elixirc_paths(_), do: ~w(lib)
end
