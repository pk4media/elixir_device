defmodule DeviceTest do
  use ExUnit.Case
  doctest Device
  doctest Device.Parser

  test "the truth" do
    assert 1 + 1 == 2
  end
end
