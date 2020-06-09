defmodule TzWorld.Mixfile do
  use Mix.Project

  @version "0.6.0"

  def project do
    [
      app: :tz_world,
      name: "TzWord",
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      docs: docs(),
      source_url: "https://github.com/kimlai/tz_world",
      description: description(),
      package: package(),
      dialyzer: [
        plt_add_apps: ~w(mix inets jason)a
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:geo, "~> 1.0 or ~> 2.0 or ~> 3.3"},
      {:jason, "~> 1.0"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false, optional: true},
      {:benchee, "~> 1.0", only: :dev, runtime: false},
      {:tesla, "~> 1.3.0"},
      {:hackney, "~> 1.15.2"}
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
      maintainers: ["Kim Laï Trinh", "Kip Cole"],
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

  @priv "priv"

  def aliases do
    [
      "compile.app": [
        fn _ -> File.mkdir_p!(@priv) end,
        "compile.app"
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
