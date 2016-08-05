defmodule DeviceCarTest do
  use ExUnit.Case

  alias Device.Parser

  @device :car

  @data [
    {"Tesla Model S", "Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3"}
  ]

  test "cars" do
    @data
    |> Enum.each(fn({device, ua}) ->
      detected = Parser.parse(ua)
      assert(detected == @device, "#{device} detected as #{detected} for #{ua}")
    end)
  end
end
