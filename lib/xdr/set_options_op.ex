defmodule StellarBase.XDR.SetOptionsOp do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `SetOptionsOp` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    OptionalAccountID,
    OptionalUint32,
    OptionalString32,
    OptionalSigner
  }

  @struct_spec XDR.Struct.new(
                 inflation_dest: OptionalAccountID,
                 clear_flags: OptionalUint32,
                 set_flags: OptionalUint32,
                 master_weight: OptionalUint32,
                 low_threshold: OptionalUint32,
                 med_threshold: OptionalUint32,
                 high_threshold: OptionalUint32,
                 home_domain: OptionalString32,
                 signer: OptionalSigner
               )

  @type inflation_dest_type :: OptionalAccountID.t()
  @type clear_flags_type :: OptionalUint32.t()
  @type set_flags_type :: OptionalUint32.t()
  @type master_weight_type :: OptionalUint32.t()
  @type low_threshold_type :: OptionalUint32.t()
  @type med_threshold_type :: OptionalUint32.t()
  @type high_threshold_type :: OptionalUint32.t()
  @type home_domain_type :: OptionalString32.t()
  @type signer_type :: OptionalSigner.t()

  @type t :: %__MODULE__{
          inflation_dest: inflation_dest_type(),
          clear_flags: clear_flags_type(),
          set_flags: set_flags_type(),
          master_weight: master_weight_type(),
          low_threshold: low_threshold_type(),
          med_threshold: med_threshold_type(),
          high_threshold: high_threshold_type(),
          home_domain: home_domain_type(),
          signer: signer_type()
        }

  defstruct [
    :inflation_dest,
    :clear_flags,
    :set_flags,
    :master_weight,
    :low_threshold,
    :med_threshold,
    :high_threshold,
    :home_domain,
    :signer
  ]

  @spec new(
          inflation_dest :: inflation_dest_type(),
          clear_flags :: clear_flags_type(),
          set_flags :: set_flags_type(),
          master_weight :: master_weight_type(),
          low_threshold :: low_threshold_type(),
          med_threshold :: med_threshold_type(),
          high_threshold :: high_threshold_type(),
          home_domain :: home_domain_type(),
          signer :: signer_type()
        ) :: t()
  def new(
        %OptionalAccountID{} = inflation_dest,
        %OptionalUint32{} = clear_flags,
        %OptionalUint32{} = set_flags,
        %OptionalUint32{} = master_weight,
        %OptionalUint32{} = low_threshold,
        %OptionalUint32{} = med_threshold,
        %OptionalUint32{} = high_threshold,
        %OptionalString32{} = home_domain,
        %OptionalSigner{} = signer
      ),
      do: %__MODULE__{
        inflation_dest: inflation_dest,
        clear_flags: clear_flags,
        set_flags: set_flags,
        master_weight: master_weight,
        low_threshold: low_threshold,
        med_threshold: med_threshold,
        high_threshold: high_threshold,
        home_domain: home_domain,
        signer: signer
      }

  @impl true
  def encode_xdr(%__MODULE__{
        inflation_dest: inflation_dest,
        clear_flags: clear_flags,
        set_flags: set_flags,
        master_weight: master_weight,
        low_threshold: low_threshold,
        med_threshold: med_threshold,
        high_threshold: high_threshold,
        home_domain: home_domain,
        signer: signer
      }) do
    [
      inflation_dest: inflation_dest,
      clear_flags: clear_flags,
      set_flags: set_flags,
      master_weight: master_weight,
      low_threshold: low_threshold,
      med_threshold: med_threshold,
      high_threshold: high_threshold,
      home_domain: home_domain,
      signer: signer
    ]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{
        inflation_dest: inflation_dest,
        clear_flags: clear_flags,
        set_flags: set_flags,
        master_weight: master_weight,
        low_threshold: low_threshold,
        med_threshold: med_threshold,
        high_threshold: high_threshold,
        home_domain: home_domain,
        signer: signer
      }) do
    [
      inflation_dest: inflation_dest,
      clear_flags: clear_flags,
      set_flags: set_flags,
      master_weight: master_weight,
      low_threshold: low_threshold,
      med_threshold: med_threshold,
      high_threshold: high_threshold,
      home_domain: home_domain,
      signer: signer
    ]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok,
       {%XDR.Struct{
          components: [
            inflation_dest: inflation_dest,
            clear_flags: clear_flags,
            set_flags: set_flags,
            master_weight: master_weight,
            low_threshold: low_threshold,
            med_threshold: med_threshold,
            high_threshold: high_threshold,
            home_domain: home_domain,
            signer: signer
          ]
        }, rest}} ->
        {:ok,
         {new(
            inflation_dest,
            clear_flags,
            set_flags,
            master_weight,
            low_threshold,
            med_threshold,
            high_threshold,
            home_domain,
            signer
          ), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{
       components: [
         inflation_dest: inflation_dest,
         clear_flags: clear_flags,
         set_flags: set_flags,
         master_weight: master_weight,
         low_threshold: low_threshold,
         med_threshold: med_threshold,
         high_threshold: high_threshold,
         home_domain: home_domain,
         signer: signer
       ]
     }, rest} = XDR.Struct.decode_xdr!(bytes, struct)

    {new(
       inflation_dest,
       clear_flags,
       set_flags,
       master_weight,
       low_threshold,
       med_threshold,
       high_threshold,
       home_domain,
       signer
     ), rest}
  end
end
