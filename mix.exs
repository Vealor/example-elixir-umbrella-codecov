defmodule Exampleproject.Mixfile do
  use Mix.Project

@version "1.0"

  def project do
    [
      apps_path: "apps",


      version: @version,
      deps: deps(),

      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,

      preferred_cli_env: [
         "coveralls": :test,
         "coveralls.html": :test,
         "coveralls.json": :test,
       ],
      test_paths: test_paths(),
      test_coverage: [tool: ExCoveralls],
    ]
  end

  defp test_paths do
    "apps/*/test" |> Path.wildcard |> Enum.sort
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      {:excoveralls, "~> 0.5.7", only: :test},
    ]
  end
end
