# BadSeed

Stores and reuses ExUnit seeds from failing test runs.

## How it works

Whenever a test run finishes unsuccesfully, BadSeed will store the used seed in
a file in the project's directory named `.bad_seed`. When the suite is run
again, it'll automatically reuse that seed. If a test run passes with that seed,
`.bad_seed` is removed to allow ExUnit to generate random seeds again.

## Installation

1. Add bad_seed to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [
      {:bad_seed, "~> 0.1.0"}
    ]
  end
  ```

2. Call `BadSeed.setup()` in `test/test_helper.exs`:

  ```
  BadSeed.setup()
  ExUnit.start()
  ```

3. Run your tests like normal.
