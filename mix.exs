defmodule Device.Mixfile do
  use Mix.Project

  def project do
    [app: :device,
     version: "1.0.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger],
     env: [unknown: :phone,
           empty: :desktop]]
  end

  defp deps do
    [{:benchfella, "~> 0.3.0", only: [:dev, :test]},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    Elixir User-Agent device detection library based on the device npm library
    """
  end

  defp package do
    [files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["David Negstad"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/pk4media/elixir_device"}]
  end
end
