# Device

Elixir UserAgent device detection based on the [device](https://github.com/rguerreiro/device) npm library.

## Installation

  1. Add `device` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:device, "~> 0.3.0"}]
    end
    ```

  2. Ensure `device` is started before your application:

    ```elixir
    def application do
      [applications: [:device]]
    end
    ```
