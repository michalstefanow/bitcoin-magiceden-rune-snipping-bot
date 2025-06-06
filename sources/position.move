// Copyright (c) Seed Labs

#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter, unused_use)]
/// Positions Module
/// Module for managing positions on bluefin spot. A user is required to first open a position
/// on bluefin spot's pools before being able to provide liquidity. 
/// Each position is a SUI object/NFT and the owner of the object/NFT is the liquidity provider
module bluefin_spot::position {
    use sui::object::{ UID, ID};
    use std::string::{ String};
    use integer_mate::i32::{I32};
    use sui::tx_context::{TxContext};

    //===========================================================//
    //                          Structs                          //
    //===========================================================//

    /// Bluefin Spot position struct
    struct Position has key, store {
        id: UID,
        pool_id: ID,
        lower_tick: I32,
        upper_tick: I32,
        fee_rate: u64,
        liquidity: u128,
        fee_growth_coin_a : u128, 
        fee_growth_coin_b : u128, 
        token_a_fee: u64, 
        token_b_fee: u64, 
        name: String,
        coin_type_a: String,
        coin_type_b: String,
        description: String,
        image_url: String,
        position_index: u128,
        reward_infos: vector<PositionRewardInfo>
    }

    /// The rewards info of an individual reward coin. Each position stores a vector of reward info for
    /// each reward token that is given out by the pool on which the position exists
    struct PositionRewardInfo has copy, drop, store {
        reward_growth_inside_last: u128,
        coins_owed_reward: u64,
    }
       

    //===========================================================//
    //                        Public Funcitons                   //
    //===========================================================//

    /// Returns the lower tick of the position
    /// Parameters:
    /// - position: reference to the position
    /// Returns:
    /// - The lower tick of the position
    public fun lower_tick(position: &Position): I32 {
        position.lower_tick
    }

    /// Returns the upper tick of the position
    /// Parameters:
    /// - position: reference to the position
    /// Returns:
    /// - The upper tick of the position
    public fun upper_tick(position: &Position): I32 {
        position.upper_tick
    }

    /// Returns the liquidity of the position
    /// Parameters:
    /// - position: reference to the position
    /// Returns:
    /// - The liquidity of the position
    public fun liquidity(position: &Position): u128 {
        position.liquidity
    }

    /// Returns the pool id of the position
    /// Parameters:
    /// - position: reference to the position
    /// Returns:
    /// - The pool id of the position
    public fun pool_id(position: &Position): ID {
        position.pool_id
    }

    /// Returns the accrued fees for the position
    /// Parameters:
    /// - position: reference to the position
    /// Returns:
    /// - The accrued fees for the position
    public fun get_accrued_fee(position: &Position): (u64, u64){
        (position.token_a_fee, position.token_b_fee)
    }

    /// Returns the coins owed for a given reward index
    /// Parameters:
    /// - position: reference to the position
    /// - index: the index of the reward
    /// Returns:
    /// - The coins owed for the given reward index
    public fun coins_owed_reward(position: &Position, index: u64) : u64 {
        abort 0
    }

    /// Returns true if the position is empty (i.e. has no liquidity, no fees accrued and no rewards owed)
    /// Parameters:
    /// - position: reference to the position
    /// Returns:
    /// - true if the position is empty, false otherwise
    public fun is_empty(position: &Position) : bool {
        abort 0
    }

    #[test_only]
    public fun open(
        pool_id: ID, 
        pool_name: String,
        image_url: String,
        coin_type_a: String, 
        coin_type_b: String,
        position_index: u128,
        lower_tick: I32, 
        upper_tick: I32, 
        fee_rate: u64, 
        ctx: &mut TxContext): Position {
            abort 0
    }

    #[test_only]
    public fun close(position: Position) {
        abort 0
    }
}