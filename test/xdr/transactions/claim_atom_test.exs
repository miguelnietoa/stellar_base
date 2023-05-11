defmodule StellarBase.XDR.ClaimAtomTest do
  use ExUnit.Case

  import StellarBase.Test.Utils

  alias StellarBase.XDR.{
    ClaimAtom,
    ClaimAtomType,
    ClaimLiquidityAtom,
    ClaimOfferAtom,
    ClaimOfferAtomV0,
    Int64,
    PoolID
  }

  setup do
    offer_id = Int64.new(123_456)

    asset_sold =
      create_asset(:alpha_num4,
        code: "BTCN",
        issuer: "GBZNLMUQMIN3VGUJISKZU7GNY3O3XLMYEHJCKCSMDHKLGSMKALRXOEZD"
      )

    amount_sold = Int64.new(1_000_000)

    asset_bought =
      create_asset(:alpha_num12,
        code: "BTCNEW2021",
        issuer: "GBZNLMUQMIN3VGUJISKZU7GNY3O3XLMYEHJCKCSMDHKLGSMKALRXOEZD"
      )

    amount_bought = Int64.new(500_000)

    {:ok,
     %{
       offer_id: offer_id,
       asset_sold: asset_sold,
       amount_sold: amount_sold,
       asset_bought: asset_bought,
       amount_bought: amount_bought
     }}
  end

  describe "ClaimOfferAtom" do
    setup %{
      offer_id: offer_id,
      asset_sold: asset_sold,
      amount_sold: amount_sold,
      asset_bought: asset_bought,
      amount_bought: amount_bought
    } do
      claim_atom_type = ClaimAtomType.new(:CLAIM_ATOM_TYPE_ORDER_BOOK)

      seller_id = create_account_id("GCNY5OXYSY4FKHOPT2SPOQZAOEIGXB5LBYW3HVU3OWSTQITS65M5RCNY")

      claim_offer_atom =
        ClaimOfferAtom.new(
          seller_id,
          offer_id,
          asset_sold,
          amount_sold,
          asset_bought,
          amount_bought
        )

      %{
        claim_atom_type: claim_atom_type,
        claim_offer_atom: claim_offer_atom,
        claim_atom: ClaimAtom.new(claim_offer_atom, claim_atom_type),
        binary:
          <<0, 0, 0, 1, 0, 0, 0, 0, 155, 142, 186, 248, 150, 56, 85, 29, 207, 158, 164, 247, 67,
            32, 113, 16, 107, 135, 171, 14, 45, 179, 214, 155, 117, 165, 56, 34, 114, 247, 89,
            216, 0, 0, 0, 0, 0, 1, 226, 64, 0, 0, 0, 1, 66, 84, 67, 78, 0, 0, 0, 0, 114, 213, 178,
            144, 98, 27, 186, 154, 137, 68, 149, 154, 124, 205, 198, 221, 187, 173, 152, 33, 210,
            37, 10, 76, 25, 212, 179, 73, 138, 2, 227, 119, 0, 0, 0, 0, 0, 15, 66, 64, 0, 0, 0, 2,
            66, 84, 67, 78, 69, 87, 50, 48, 50, 49, 0, 0, 0, 0, 0, 0, 114, 213, 178, 144, 98, 27,
            186, 154, 137, 68, 149, 154, 124, 205, 198, 221, 187, 173, 152, 33, 210, 37, 10, 76,
            25, 212, 179, 73, 138, 2, 227, 119, 0, 0, 0, 0, 0, 7, 161, 32>>
      }
    end

    test "new/1", %{claim_offer_atom: claim_offer_atom, claim_atom_type: claim_atom_type} do
      %ClaimAtom{value: ^claim_offer_atom, type: ^claim_atom_type} =
        ClaimAtom.new(claim_offer_atom, claim_atom_type)
    end

    test "encode_xdr/1", %{claim_atom: claim_atom, binary: binary} do
      {:ok, ^binary} = ClaimAtom.encode_xdr(claim_atom)
    end

    test "encode_xdr!/1", %{claim_atom: claim_atom, binary: binary} do
      ^binary = ClaimAtom.encode_xdr!(claim_atom)
    end

    test "decode_xdr/2", %{claim_atom: claim_atom, binary: binary} do
      {:ok, {^claim_atom, ""}} = ClaimAtom.decode_xdr(binary)
    end

    test "decode_xdr/2 with an invalid binary" do
      {:error, :not_binary} = ClaimAtom.decode_xdr(123)
    end

    test "decode_xdr!/2", %{claim_atom: claim_atom, binary: binary} do
      {^claim_atom, ^binary} = ClaimAtom.decode_xdr!(binary <> binary)
    end
  end

  describe "ClaimOfferAtomV0" do
    setup %{
      offer_id: offer_id,
      asset_sold: asset_sold,
      amount_sold: amount_sold,
      asset_bought: asset_bought,
      amount_bought: amount_bought
    } do
      claim_atom_type = ClaimAtomType.new(:CLAIM_ATOM_TYPE_V0)

      seller_ed25519 =
        ed25519_public_key("GCNY5OXYSY4FKHOPT2SPOQZAOEIGXB5LBYW3HVU3OWSTQITS65M5RCNY")

      claim_offer_atom =
        ClaimOfferAtomV0.new(
          seller_ed25519,
          offer_id,
          asset_sold,
          amount_sold,
          asset_bought,
          amount_bought
        )

      %{
        claim_atom_type: claim_atom_type,
        claim_offer_atom: claim_offer_atom,
        claim_atom: ClaimAtom.new(claim_offer_atom, claim_atom_type),
        binary:
          <<0, 0, 0, 0, 155, 142, 186, 248, 150, 56, 85, 29, 207, 158, 164, 247, 67, 32, 113, 16,
            107, 135, 171, 14, 45, 179, 214, 155, 117, 165, 56, 34, 114, 247, 89, 216, 0, 0, 0, 0,
            0, 1, 226, 64, 0, 0, 0, 1, 66, 84, 67, 78, 0, 0, 0, 0, 114, 213, 178, 144, 98, 27,
            186, 154, 137, 68, 149, 154, 124, 205, 198, 221, 187, 173, 152, 33, 210, 37, 10, 76,
            25, 212, 179, 73, 138, 2, 227, 119, 0, 0, 0, 0, 0, 15, 66, 64, 0, 0, 0, 2, 66, 84, 67,
            78, 69, 87, 50, 48, 50, 49, 0, 0, 0, 0, 0, 0, 114, 213, 178, 144, 98, 27, 186, 154,
            137, 68, 149, 154, 124, 205, 198, 221, 187, 173, 152, 33, 210, 37, 10, 76, 25, 212,
            179, 73, 138, 2, 227, 119, 0, 0, 0, 0, 0, 7, 161, 32>>
      }
    end

    test "new/1", %{claim_offer_atom: claim_offer_atom, claim_atom_type: claim_atom_type} do
      %ClaimAtom{value: ^claim_offer_atom, type: ^claim_atom_type} =
        ClaimAtom.new(claim_offer_atom, claim_atom_type)
    end

    test "encode_xdr/1", %{claim_atom: claim_atom, binary: binary} do
      {:ok, ^binary} = ClaimAtom.encode_xdr(claim_atom)
    end

    test "encode_xdr!/1", %{claim_atom: claim_atom, binary: binary} do
      ^binary = ClaimAtom.encode_xdr!(claim_atom)
    end

    test "decode_xdr/2", %{claim_atom: claim_atom, binary: binary} do
      {:ok, {^claim_atom, ""}} = ClaimAtom.decode_xdr(binary)
    end

    test "decode_xdr!/2", %{claim_atom: claim_atom, binary: binary} do
      {^claim_atom, ^binary} = ClaimAtom.decode_xdr!(binary <> binary)
    end
  end

  describe "ClaimLiquidityAtom" do
    setup %{
      asset_sold: asset_sold,
      amount_sold: amount_sold,
      asset_bought: asset_bought,
      amount_bought: amount_bought
    } do
      claim_atom_type = ClaimAtomType.new(:CLAIM_ATOM_TYPE_LIQUIDITY_POOL)

      pool_id = PoolID.new("GCIZ3GSM5XL7OUS4UP64THMDZ7CZ3ZWN")

      claim_offer_atom =
        ClaimLiquidityAtom.new(
          pool_id,
          asset_sold,
          amount_sold,
          asset_bought,
          amount_bought
        )

      %{
        claim_atom_type: claim_atom_type,
        claim_offer_atom: claim_offer_atom,
        claim_atom: ClaimAtom.new(claim_offer_atom, claim_atom_type),
        binary:
          <<0, 0, 0, 2, 71, 67, 73, 90, 51, 71, 83, 77, 53, 88, 76, 55, 79, 85, 83, 52, 85, 80,
            54, 52, 84, 72, 77, 68, 90, 55, 67, 90, 51, 90, 87, 78, 0, 0, 0, 1, 66, 84, 67, 78, 0,
            0, 0, 0, 114, 213, 178, 144, 98, 27, 186, 154, 137, 68, 149, 154, 124, 205, 198, 221,
            187, 173, 152, 33, 210, 37, 10, 76, 25, 212, 179, 73, 138, 2, 227, 119, 0, 0, 0, 0, 0,
            15, 66, 64, 0, 0, 0, 2, 66, 84, 67, 78, 69, 87, 50, 48, 50, 49, 0, 0, 0, 0, 0, 0, 114,
            213, 178, 144, 98, 27, 186, 154, 137, 68, 149, 154, 124, 205, 198, 221, 187, 173, 152,
            33, 210, 37, 10, 76, 25, 212, 179, 73, 138, 2, 227, 119, 0, 0, 0, 0, 0, 7, 161, 32>>
      }
    end

    test "new/1", %{claim_offer_atom: claim_offer_atom, claim_atom_type: claim_atom_type} do
      %ClaimAtom{value: ^claim_offer_atom, type: ^claim_atom_type} =
        ClaimAtom.new(claim_offer_atom, claim_atom_type)
    end

    test "encode_xdr/1", %{claim_atom: claim_atom, binary: binary} do
      {:ok, ^binary} = ClaimAtom.encode_xdr(claim_atom)
    end

    test "encode_xdr!/1", %{claim_atom: claim_atom, binary: binary} do
      ^binary = ClaimAtom.encode_xdr!(claim_atom)
    end

    test "decode_xdr/2", %{claim_atom: claim_atom, binary: binary} do
      {:ok, {^claim_atom, ""}} = ClaimAtom.decode_xdr(binary)
    end

    test "decode_xdr!/2", %{claim_atom: claim_atom, binary: binary} do
      {^claim_atom, ^binary} = ClaimAtom.decode_xdr!(binary <> binary)
    end
  end
end
