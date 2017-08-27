use Mix.Config

if Mix.env == :test do
  config :bad_seed, file_module: FileMock
  config :bad_seed, system_module: SystemMock
end
