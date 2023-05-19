defmodule StellarBase.XDR.DontHave do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `DontHave` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    MessageType,
    Uint256
  }

  @struct_spec XDR.Struct.new(
                 type: MessageType,
                 req_hash: Uint256
               )

  @type type_type :: MessageType.t()
  @type req_hash_type :: Uint256.t()

  @type t :: %__MODULE__{type: type_type(), req_hash: req_hash_type()}

  defstruct [:type, :req_hash]

  @spec new(type :: type_type(), req_hash :: req_hash_type()) :: t()
  def new(
        %MessageType{} = type,
        %Uint256{} = req_hash
      ),
      do: %__MODULE__{type: type, req_hash: req_hash}

  @impl true
  def encode_xdr(%__MODULE__{type: type, req_hash: req_hash}) do
    [type: type, req_hash: req_hash]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{type: type, req_hash: req_hash}) do
    [type: type, req_hash: req_hash]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [type: type, req_hash: req_hash]}, rest}} ->
        {:ok, {new(type, req_hash), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [type: type, req_hash: req_hash]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(type, req_hash), rest}
  end
end
