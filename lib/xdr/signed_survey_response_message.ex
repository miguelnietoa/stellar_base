defmodule StellarBase.XDR.SignedSurveyResponseMessage do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SignedSurveyResponseMessage` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    Signature,
    SurveyResponseMessage
  }

  @struct_spec XDR.Struct.new(
                 response_signature: Signature,
                 response: SurveyResponseMessage
               )

  @type response_signature_type :: Signature.t()
  @type response_type :: SurveyResponseMessage.t()

  @type t :: %__MODULE__{response_signature: response_signature_type(), response: response_type()}

  defstruct [:response_signature, :response]

  @spec new(response_signature :: response_signature_type(), response :: response_type()) :: t()
  def new(
        %Signature{} = response_signature,
        %SurveyResponseMessage{} = response
      ),
      do: %__MODULE__{response_signature: response_signature, response: response}

  @impl true
  def encode_xdr(%__MODULE__{response_signature: response_signature, response: response}) do
    [response_signature: response_signature, response: response]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{response_signature: response_signature, response: response}) do
    [response_signature: response_signature, response: response]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok,
       {%XDR.Struct{components: [response_signature: response_signature, response: response]},
        rest}} ->
        {:ok, {new(response_signature, response), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{components: [response_signature: response_signature, response: response]}, rest} =
      XDR.Struct.decode_xdr!(bytes, struct)

    {new(response_signature, response), rest}
  end
end
