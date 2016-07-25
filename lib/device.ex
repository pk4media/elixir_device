defmodule Device do
  use Application

  @doc false
  def start(_type, _args) do
    {:ok, nil}
  end

  @doc"""
  Return a boolean indicating whether the given User-Agent string evaluates as a phone device

  ## Examples

    iex> Device.is_phone?("Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.11) ASUS-P552w/1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1")
    true
    iex> Device.is_phone?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    false
  """
  @spec is_phone?(String.t | nil) :: boolean
  def is_phone?(ua) do
    Device.Parser.parse(ua) == "phone"
  end

  @doc"""
  Return a boolean indicating whether the given User-Agent string evaluates as a tablet device

  ## Examples

    iex> Device.is_tablet?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    true
    iex> Device.is_tablet?("")
    false
  """
  @spec is_tablet?(String.t | nil) :: boolean
  def is_tablet?(ua) do
    Device.Parser.parse(ua) == "tablet"
  end

  @doc"""
  Return a boolean indicating whether the given User-Agent string evaluates as a desktop device

  ## Examples

    iex> Device.is_desktop?("Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0")
    true
    iex> Device.is_desktop?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    false
  """
  @spec is_desktop?(String.t | nil) :: boolean
  def is_desktop?(ua) do
    Device.Parser.parse(ua) == "desktop"
  end

  @doc"""
  Return a boolean indicating whether the given User-Agent string evaluates as a car device

  ## Examples

    iex> Device.is_car?("Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3")
    true
    iex> Device.is_car?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    false
  """
  @spec is_car?(String.t | nil) :: boolean
  def is_car?(ua) do
    Device.Parser.parse(ua) == Application.fetch_env!(:device, :car_device_type)
  end

  @doc"""
  Return a boolean indicating whether the given User-Agent string evaluates as a bot device

  ## Examples

    iex> Device.is_bot?("LinkedInBot/1.0 (compatible; Mozilla/5.0; Jakarta Commons-HttpClient/3.1 +http://www.linkedin.com)")
    true
    iex> Device.is_bot?("Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3")
    false
  """
  @spec is_bot?(String.t | nil) :: boolean
  def is_bot?(ua) do
    Device.Parser.parse(ua) == Application.fetch_env!(:device, :bot_device_type)
  end
end
