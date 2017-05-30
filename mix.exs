defmodule Ashes.Mixfile do
  use Mix.Project

  def project do
    [app: :ashes,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  def application do
    [mod: {Ashes.Application, []},
     extra_applications: [:logger, :runtime_tools, :coherence]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [{:phoenix, "~> 1.3.0-rc", override: true},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.2"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:gettext, "~> 0.11"},
     {:rename, "~> 0.1.0"},
     {:coherence, github: "smpallen99/coherence", branch: "phx-1.3"},
     {:cowboy, "~> 1.0"},

     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:credo, "~> 0.", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
