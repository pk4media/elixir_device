defmodule Device do
  use Application

  @doc false
  def start(_type, _args) do
    {:ok, nil}
  end

  @doc"""
  Return a boolean indicating whether the given User-Agent string or parser response evaluates as a phone device

  ## Examples

    iex> Device.is_phone?("Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.11) ASUS-P552w/1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1")
    true
    iex> Device.is_phone?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    false
    iex> Device.Parser.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.11) ASUS-P552w/1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1") |> Device.is_phone?
    true
  """
  @spec is_phone?(Atom.t | String.t | nil) :: boolean
  def is_phone?(type) when is_atom(type), do: type == :phone
  def is_phone?(ua) when is_binary(ua), do: Device.Parser.parse(ua) |> is_phone?

  @doc"""
  Return a boolean indicating whether the given User-Agent string or parser response evaluates as a tablet device

  ## Examples

    iex> Device.Parser.parse("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367") |> Device.is_tablet?
    true
    iex> Device.is_tablet?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    true
    iex> Device.is_tablet?("")
    false
  """
  @spec is_tablet?(Atom.t | String.t | nil) :: boolean
  def is_tablet?(type) when is_atom(type), do: type == :tablet
  def is_tablet?(ua) when is_binary(ua), do: Device.Parser.parse(ua) |> is_tablet?

  @doc"""
  Return a boolean indicating whether the given User-Agent string or parser response evaluates as a desktop device

  ## Examples

    iex> Device.Parser.parse("Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0") |> Device.is_desktop?
    true
    iex> Device.is_desktop?("Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0")
    true
    iex> Device.is_desktop?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    false
  """
  @spec is_desktop?(Atom.t | String.t | nil) :: boolean
  def is_desktop?(type) when is_atom(type), do: type == :desktop
  def is_desktop?(ua) when is_binary(ua), do: Device.Parser.parse(ua) |> is_desktop?

  @doc"""
  Return a boolean indicating whether the given User-Agent string or parser response evaluates as a tv device

  ## Examples

    iex> Device.Parser.parse("Opera/9.80 (Linux mips ; U; HbbTV/1.1.1 (; Philips; ; ; ; ) CE-HTML/1.0 NETTV/3.1.0; en) Presto/2.6.33 Version/10.70") |> Device.is_tv?
    true
    iex> Device.is_tv?("Opera/9.80 (Linux mips ; U; HbbTV/1.1.1 (; Philips; ; ; ; ) CE-HTML/1.0 NETTV/3.1.0; en) Presto/2.6.33 Version/10.70")
    true
    iex> Device.is_tv?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    false
  """
  @spec is_tv?(Atom.t | String.t | nil) :: boolean
  def is_tv?(type) when is_atom(type), do: type == :tv
  def is_tv?(ua) when is_binary(ua), do: Device.Parser.parse(ua) |> is_tv?

  @doc"""
  Return a boolean indicating whether the given User-Agent string or parser response evaluates as a car device

  ## Examples

    iex> Device.Parser.parse("Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3") |> Device.is_car?
    true
    iex> Device.is_car?("Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3")
    true
    iex> Device.is_car?("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B367")
    false
  """
  @spec is_car?(Atom.t | String.t | nil) :: boolean
  def is_car?(type) when is_atom(type), do: type == :car
  def is_car?(ua) when is_binary(ua), do: Device.Parser.parse(ua) |> is_car?

  @doc"""
  Return a boolean indicating whether the given User-Agent string or parser response evaluates as a bot device

  ## Examples

    iex> Device.Parser.parse("LinkedInBot/1.0 (compatible; Mozilla/5.0; Jakarta Commons-HttpClient/3.1 +http://www.linkedin.com)") |> Device.is_bot?
    true
    iex> Device.is_bot?("LinkedInBot/1.0 (compatible; Mozilla/5.0; Jakarta Commons-HttpClient/3.1 +http://www.linkedin.com)")
    true
    iex> Device.is_bot?("Mozilla/5.0 (X11; u; Linux; C) AppleWebKit /533.3 (Khtml, like Gheko) QtCarBrowser Safari /533.3")
    false
  """
  @spec is_bot?(Atom.t | String.t | nil) :: boolean
  def is_bot?(type) when is_atom(type), do: type == :bot
  def is_bot?(ua) when is_binary(ua), do: Device.Parser.parse(ua) |> is_bot?
end
