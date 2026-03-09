module aoxc::marketplace {
    use std::string::String;
    use std::vector;
    use aoxc::errors;
    use sui::event;
    use sui::object::{Self, UID};
    use sui::table::{Self, Table};
    use sui::tx_context::{Self, TxContext};

    public struct MarketplaceAdminCap has key, store { id: UID }

    public struct DatasetMarketplace has key {
        id: UID,
        listings: Table<u64, DatasetListing>,
        listed_blob_ids: Table<vector<u8>, bool>,
        next_id: u64,
    }

    public struct DatasetListing has copy, drop, store {
        id: u64,
        seller: address,
        walrus_blob_id: vector<u8>,
        license_hash: vector<u8>,
        ask_amount: u64,
        active: bool,
        title: String,
    }

    public struct DatasetListed has copy, drop { id: u64, seller: address, ask_amount: u64 }
    public struct DatasetPurchased has copy, drop { id: u64, buyer: address, ask_amount: u64 }
    public struct DatasetCancelled has copy, drop { id: u64, seller: address }

    public fun validate_listing_inputs(walrus_blob_id: &vector<u8>, license_hash: &vector<u8>, ask_amount: u64) {
        assert!(vector::length(walrus_blob_id) > 0, errors::E_EMPTY_HASH);
        assert!(vector::length(license_hash) > 0, errors::E_MARKETPLACE_LICENSE);
        assert!(ask_amount > 0, errors::E_AMOUNT_ZERO);
    }

    entry fun init(ctx: &mut TxContext) {
        let cap = MarketplaceAdminCap { id: object::new(ctx) };
        let market = DatasetMarketplace {
            id: object::new(ctx),
            listings: table::new<u64, DatasetListing>(ctx),
            listed_blob_ids: table::new<vector<u8>, bool>(ctx),
            next_id: 1,
        };

        sui::transfer::share_object(market);
        sui::transfer::transfer(cap, tx_context::sender(ctx));
    }

    entry fun list_dataset(
        market: &mut DatasetMarketplace,
        title: String,
        walrus_blob_id: vector<u8>,
        license_hash: vector<u8>,
        ask_amount: u64,
        ctx: &TxContext,
    ) {
        validate_listing_inputs(&walrus_blob_id, &license_hash, ask_amount);

        assert!(!table::contains(&market.listed_blob_ids, &walrus_blob_id), errors::E_ALREADY_EXISTS);

        let id = market.next_id;
        market.next_id = market.next_id + 1;
        let seller = tx_context::sender(ctx);

        table::add(&mut market.listed_blob_ids, copy walrus_blob_id, true);
        table::add(&mut market.listings, id, DatasetListing {
            id,
            seller,
            walrus_blob_id,
            license_hash,
            ask_amount,
            active: true,
            title,
        });

        event::emit(DatasetListed { id, seller, ask_amount });
    }

    entry fun purchase_dataset(
        market: &mut DatasetMarketplace,
        listing_id: u64,
        buyer: address,
    ) {
        assert!(table::contains(&market.listings, listing_id), errors::E_NOT_FOUND);
        let listing = table::borrow_mut(&mut market.listings, listing_id);
        assert!(listing.active, errors::E_ALREADY_FINALIZED);
        listing.active = false;
        table::remove(&mut market.listed_blob_ids, copy listing.walrus_blob_id);

        event::emit(DatasetPurchased { id: listing_id, buyer, ask_amount: listing.ask_amount });
    }

    entry fun cancel_listing(
        market: &mut DatasetMarketplace,
        listing_id: u64,
        ctx: &TxContext,
    ) {
        assert!(table::contains(&market.listings, listing_id), errors::E_NOT_FOUND);
        let listing = table::borrow_mut(&mut market.listings, listing_id);
        assert!(listing.active, errors::E_ALREADY_FINALIZED);
        assert!(listing.seller == tx_context::sender(ctx), errors::E_NOT_AUTHORIZED);

        listing.active = false;
        table::remove(&mut market.listed_blob_ids, copy listing.walrus_blob_id);
        event::emit(DatasetCancelled { id: listing_id, seller: listing.seller });
    }
}
