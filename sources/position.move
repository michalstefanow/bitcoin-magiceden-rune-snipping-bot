// Copyright (c) Seed Labs

#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter)]
/// Module for managing a position
module bluefin_spot::position {
    use sui::object::{ UID, ID};
    use std::string::{ String};
    use integer_mate::i32::{I32};

    //===========================================================//
    //                          Structs                          //
    //===========================================================//

    struct POSITION has drop {
        dummy_field: bool
    }

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

    struct PositionRewardInfo has copy, drop, store {
        reward_growth_inside_last: u128,
        coins_owed_reward: u64,
    }
       

    //===========================================================//
    //                        Public Funcitons                   //
    //===========================================================//


    public fun lower_tick(position: &Position): I32 {
        position.lower_tick
    }

    public fun upper_tick(position: &Position): I32 {
        position.upper_tick
    }

    public fun liquidity(position: &Position): u128 {
        position.liquidity
    }

    public fun pool_id(position: &Position): ID {
        position.pool_id
    }

    public fun get_accrued_fee(position: &Position): (u64, u64){
        (position.token_a_fee, position.token_b_fee)
    }

    public fun coins_owed_reward(position: &Position, index: u64) : u64 {
        abort 0
    }

    public fun is_empty(position: &Position) : bool {
        abort 0
    }
}