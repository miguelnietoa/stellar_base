defmodule StellarBase.XDR.DecoratedSignature do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `DecoratedSignature` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    SignatureHint,
    Signature
  }

  @struct_spec XDR.Struct.new(
                 hint: SignatureHint,
                 signature: Signature
               )

  @type hint_type :: SignatureHint.t()
  @type signature_type :: Signature.t()

  @type t :: %__MODULE__{hint: hint_type(), signature: signature_type()}

  defstruct [:hint, :signature]

  @spec new(hint :: hint_type(), signature :: signature_type()) :: t()
  def new(
        %SignatureHint{} = hint,
        %Signature{} = signature
      ),
      do: %__MODULE__{hint: hint, signature: signature}

  @impl true
  def encode_xdr(%__MODULE__{hint: hint, signature: signature}) do
    [hint: hint, signature: signature]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{hint: hint, signature: signature}) do
    [hint: hint, signature: signature]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [hint: hint, signature: signature]}, rest}} ->
        {:ok, {new(hint, signature), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [hint: hint, signature: signature]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(hint, signature), rest}
  end
end
