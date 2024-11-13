// Copyright (c) Seed Labs

#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter)]
/// Tick Module
/// The module is responsible for creating/managing/manipluating ticks information
module bluefin_spot::tick {
    use sui::table::{Table};
    use integer_mate::i32::{I32};
    use integer_mate::i128::{I128};
    use integer_mate::i64::{I64};

    //===========================================================//
    //                           Structs                         //
    //===========================================================//

    /// Ticks manager
    /// Stores all current ticks and their bitmap
    struct TickManager has store {
        tick_spacing: u32,
        ticks: Table<I32, TickInfo>,                    
        bitmap: Table<I32, u256>,
    }

    /// Struct representing a single Tick
    struct TickInfo has copy, drop, store {
        index: I32, 
        sqrt_price: u128,
        liquidity_gross: u128, 
        liquidity_net: I128,
        fee_growth_outside_a: u128,
        fee_growth_outside_b: u128,
        tick_cumulative_out_side: I64,
        seconds_per_liquidity_out_side: u256,
        seconds_out_side: u64,
        reward_growths_outside: vector<u128>
    }


    public fun get_tick_from_table(ticks: &Table<I32, TickInfo>, index: I32) : &TickInfo {
        abort 0
    }   

    public fun get_tick_from_manager(manager: &TickManager, index: I32) : &TickInfo {
        abort 0
    }   

    public fun sqrt_price(tick: &TickInfo) : u128 {
        tick.sqrt_price
    }

    public fun create_tick(index: I32): TickInfo {
        abort 0
    }

    public fun liquidity_gross(tick: &TickInfo): u128 {
        tick.liquidity_gross
    }

    public fun liquidity_net(tick: &TickInfo): I128 {
        tick.liquidity_net
    }

    public fun tick_spacing(manager: &TickManager): u32 {
        manager.tick_spacing
    }

    public fun get_fee_and_reward_growths_inside(manager: &TickManager, lower_tick_index: I32, upper_tick_index: I32, current_tick_index: I32, fee_growth_global_coin_a: u128, fee_growth_global_coin_b: u128, reward_growths_global: vector<u128>) : (u128, u128, vector<u128>) {
        abort 0
    }

    public fun get_fee_and_reward_growths_outside(manager: &TickManager, tick_index: I32) : (u128, u128, vector<u128>) {
        abort 0
    }

    public fun is_tick_initialized(manager: &TickManager, tick_index: I32) : bool {
        abort 0
    }

    public fun bitmap(manager: &TickManager ): &Table<I32, u256> {
        &manager.bitmap
    }   

    public fun fetch_provided_ticks(manager: &TickManager, ticks: vector<u32>): vector<TickInfo> {
       abort 0
    }

}