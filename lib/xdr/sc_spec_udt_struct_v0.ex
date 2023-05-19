defmodule StellarBase.XDR.SCSpecUDTStructV0 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SCSpecUDTStructV0` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    String1024,
    String80,
    String60,
    SCSpecUDTStructFieldV0List40
  }

  @struct_spec XDR.Struct.new(
                 doc: String1024,
                 lib: String80,
                 name: String60,
                 fields: SCSpecUDTStructFieldV0List40
               )

  @type doc_type :: String1024.t()
  @type lib_type :: String80.t()
  @type name_type :: String60.t()
  @type fields_type :: SCSpecUDTStructFieldV0List40.t()

  @type t :: %__MODULE__{
          doc: doc_type(),
          lib: lib_type(),
          name: name_type(),
          fields: fields_type()
        }

  defstruct [:doc, :lib, :name, :fields]

  @spec new(doc :: doc_type(), lib :: lib_type(), name :: name_type(), fields :: fields_type()) ::
          t()
  def new(
        %String1024{} = doc,
        %String80{} = lib,
        %String60{} = name,
        %SCSpecUDTStructFieldV0List40{} = fields
      ),
      do: %__MODULE__{doc: doc, lib: lib, name: name, fields: fields}

  @impl true
  def encode_xdr(%__MODULE__{doc: doc, lib: lib, name: name, fields: fields}) do
    [doc: doc, lib: lib, name: name, fields: fields]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{doc: doc, lib: lib, name: name, fields: fields}) do
    [doc: doc, lib: lib, name: name, fields: fields]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [doc: doc, lib: lib, name: name, fields: fields]}, rest}} ->
        {:ok, {new(doc, lib, name, fields), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [doc: doc, lib: lib, name: name, fields: fields]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(doc, lib, name, fields), rest}
  end
end
