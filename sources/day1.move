module MyModule::DigitalTwinNFTs {
    use aptos_framework::signer;

    /// Struct representing a Digital Twin NFT.
    struct DigitalTwin has key, store {
        owner: address,
        metadata: vector<u8>,
    }

    /// Function to mint a new Digital Twin NFT.
    public fun mint_nft(owner: &signer, metadata: vector<u8>) {
        let nft = DigitalTwin {
            owner: signer::address_of(owner),
            metadata,
        };
        move_to(owner, nft);
    }

    /// Function to transfer the NFT to a new owner.
    public fun transfer_nft(from: &signer, to: address) acquires DigitalTwin {
        let nft = borrow_global_mut<DigitalTwin>(signer::address_of(from));
        nft.owner = to;
    }
}
