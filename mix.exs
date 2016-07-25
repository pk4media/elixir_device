defmodule Device.Mixfile do
  use Mix.Project

  def project do
    [app: :device,
     version: "0.3.8",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger],
     env: [car_device_type: "car",
           bot_device_type: "bot",
           unknown_device_type: "phone",
           empty_device_type: "desktop"]]
  end

  defp deps do
    [{:benchfella, "~> 0.3.0", only: [:dev, :test]}]
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
