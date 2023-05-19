defmodule StellarBase.XDR.PathPaymentStrictSendResultSuccess do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `PathPaymentStrictSendResultSuccess` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ClaimAtomList,
    SimplePaymentResult
  }

  @struct_spec XDR.Struct.new(
                 offers: ClaimAtomList,
                 last: SimplePaymentResult
               )

  @type offers_type :: ClaimAtomList.t()
  @type last_type :: SimplePaymentResult.t()

  @type t :: %__MODULE__{offers: offers_type(), last: last_type()}

  defstruct [:offers, :last]

  @spec new(offers :: offers_type(), last :: last_type()) :: t()
  def new(
        %ClaimAtomList{} = offers,
        %SimplePaymentResult{} = last
      ),
      do: %__MODULE__{offers: offers, last: last}

  @impl true
  def encode_xdr(%__MODULE__{offers: offers, last: last}) do
    [offers: offers, last: last]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{offers: offers, last: last}) do
    [offers: offers, last: last]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [offers: offers, last: last]}, rest}} ->
        {:ok, {new(offers, last), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [offers: offers, last: last]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(offers, last), rest}
  end
end
