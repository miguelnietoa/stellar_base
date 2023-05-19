defmodule StellarBase.XDR.TimeBounds do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TimeBounds` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    TimePoint
  }

  @struct_spec XDR.Struct.new(
                 min_time: TimePoint,
                 max_time: TimePoint
               )

  @type min_time_type :: TimePoint.t()
  @type max_time_type :: TimePoint.t()

  @type t :: %__MODULE__{min_time: min_time_type(), max_time: max_time_type()}

  defstruct [:min_time, :max_time]

  @spec new(min_time :: min_time_type(), max_time :: max_time_type()) :: t()
  def new(
        %TimePoint{} = min_time,
        %TimePoint{} = max_time
      ),
      do: %__MODULE__{min_time: min_time, max_time: max_time}

  @impl true
  def encode_xdr(%__MODULE__{min_time: min_time, max_time: max_time}) do
    [min_time: min_time, max_time: max_time]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{min_time: min_time, max_time: max_time}) do
    [min_time: min_time, max_time: max_time]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [min_time: min_time, max_time: max_time]}, rest}} ->
        {:ok, {new(min_time, max_time), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [min_time: min_time, max_time: max_time]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(min_time, max_time), rest}
  end
end
