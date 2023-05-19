defmodule StellarBase.XDR.SCSpecUDTEnumCaseV0 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCSpecUDTEnumCaseV0` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    String1024,
    String60,
    Uint32
  }

  @struct_spec XDR.Struct.new(
                 doc: String1024,
                 name: String60,
                 value: Uint32
               )

  @type doc_type :: String1024.t()
  @type name_type :: String60.t()
  @type value_type :: Uint32.t()

  @type t :: %__MODULE__{doc: doc_type(), name: name_type(), value: value_type()}

  defstruct [:doc, :name, :value]

  @spec new(doc :: doc_type(), name :: name_type(), value :: value_type()) :: t()
  def new(
        %String1024{} = doc,
        %String60{} = name,
        %Uint32{} = value
      ),
      do: %__MODULE__{doc: doc, name: name, value: value}

  @impl true
  def encode_xdr(%__MODULE__{doc: doc, name: name, value: value}) do
    [doc: doc, name: name, value: value]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{doc: doc, name: name, value: value}) do
    [doc: doc, name: name, value: value]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [doc: doc, name: name, value: value]}, rest}} ->
        {:ok, {new(doc, name, value), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [doc: doc, name: name, value: value]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(doc, name, value), rest}
  end
end
