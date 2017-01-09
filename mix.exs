defmodule Sentry.Mixfile do
  use Mix.Project

  def project do
    [
      app: :sentry,
      version: "2.1.0",
      elixir: "~> 1.3",
      description: "The Official Elixir client for Sentry",
      package: package(),
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env),
      docs: [extras: ["README.md"], main: "readme"]
    ]
  end

  def application do
    [
      mod: {Sentry, []},
      applications: [:tesla, :uuid, :poison, :logger]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 0.5"},
      {:uuid, "~> 1.0"},
      {:poison, "~> 1.5 or ~> 2.0 or ~> 3.0"},
      {:plug, "~> 1.0", optional: true},

      {:ex_doc, "~> 0.14.0", only: :dev},
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:bypass, "~> 0.5.1", only: [:test]}
    ]
  end

  defp package do
    [
      files: ["lib", "LICENSE", "mix.exs", "README.md"],
      maintainers: ["Stanislav Vishnevskiy", "Mitchell Henke", "Jason Stiebs"],
      licenses: ["MIT"],
      links: %{
        "github" => "https://github.com/getsentry/sentry-elixir"
      }
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
