defmodule GrpcClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :grpc_client,
      version: "0.1.1",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      test_coverage: [
        ignore_modules: [
          Routeguide.Rectangle,
          Routeguide.RouteNote,
          Routeguide.RouteSummary,
          Routeguide.Feature,
          Routeguide.Point
        ]
      ],
      name: "GrpcClient",
      description: description(),
      deps: deps(),
      package: package()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:castore, "~> 0.1.0"},
      {:connection, "~> 1.1"},
      {:mint, "~> 1.4"},
      {:nimble_options, "~> 0.5.2"},
      {:protox, "~> 1.6"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    "A gRPC client using Mint."
  end

  defp package do
    [
      name: "grpc_client",
      files: ~w(lib .formatter.exs mix.exs README.md),
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/hkrutzer/grpc_client/"
      }
    ]
  end
end
