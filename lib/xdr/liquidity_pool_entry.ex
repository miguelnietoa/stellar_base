defmodule StellarBase.XDR.LiquidityPoolEntry do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `LiquidityPoolEntry` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    PoolID,
    LiquidityPoolEntryBody
  }

  @struct_spec XDR.Struct.new(
                 liquidity_pool_id: PoolID,
                 body: LiquidityPoolEntryBody
               )

  @type liquidity_pool_id_type :: PoolID.t()
  @type body_type :: LiquidityPoolEntryBody.t()

  @type t :: %__MODULE__{liquidity_pool_id: liquidity_pool_id_type(), body: body_type()}

  defstruct [:liquidity_pool_id, :body]

  @spec new(liquidity_pool_id :: liquidity_pool_id_type(), body :: body_type()) :: t()
  def new(
        %PoolID{} = liquidity_pool_id,
        %LiquidityPoolEntryBody{} = body
      ),
      do: %__MODULE__{liquidity_pool_id: liquidity_pool_id, body: body}

  @impl true
  def encode_xdr(%__MODULE__{liquidity_pool_id: liquidity_pool_id, body: body}) do
    [liquidity_pool_id: liquidity_pool_id, body: body]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{liquidity_pool_id: liquidity_pool_id, body: body}) do
    [liquidity_pool_id: liquidity_pool_id, body: body]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok, {%XDR.Struct{components: [liquidity_pool_id: liquidity_pool_id, body: body]}, rest}} ->
        {:ok, {new(liquidity_pool_id, body), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [liquidity_pool_id: liquidity_pool_id, body: body]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(liquidity_pool_id, body), rest}
  end
end
