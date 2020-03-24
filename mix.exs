defmodule TzWorld.Mixfile do
  use Mix.Project

  @version "0.3.0"

  def project do
    [
      app: :tz_world,
      name: "TzWord",
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      source_url: "https://github.com/kimlai/tz_world",
      description: description(),
      package: package(),
      dialyzer: [
        plt_add_apps: ~w(mix jason)a
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {TzWorld.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:geo, "~> 1.0 or ~> 2.0 or ~> 3.0"},
      {:jason, "~> 1.0", optional: true},
      {:tesla, "~> 1.3"},
      {:mint, "~> 1.0"},
      {:castore, "~> 0.1"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc", only: :dev, runtime: false, optional: true}
    ]
  end

  defp description do
    """
    Resolve timezone names from a location.
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      links: links(),
      maintainers: ["Kim Laï Trinh"],
      files: [
        "lib",
        "config",
        "mix.exs",
        "README*",
        "CHANGELOG*",
        "LICENSE*"
      ]
    ]
  end

  def links do
    %{
      "GitHub" => "https://github.com/kimlai/tz_world",
      "Readme" => "https://github.com/kimlai/tz_world/blob/v#{@version}/README.md",
      "Changelog" => "https://github.com/kimlai/tz_world/blob/v#{@version}/CHANGELOG.md"
    }
  end

  def docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: [
        "README.md",
        "LICENSE.md",
        "CHANGELOG.md"
      ],
      skip_undefined_reference_warnings_on: ["changelog"]
    ]
  end
end
