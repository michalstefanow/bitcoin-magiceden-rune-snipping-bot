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


    /// Returns the tick info from the table
    /// Parameters:
    /// - ticks: reference to the table of ticks
    /// - index: the index of the tick
    /// Returns:
    /// - The tick info for the given index
    public fun get_tick_from_table(ticks: &Table<I32, TickInfo>, index: I32) : &TickInfo {
        abort 0
    }   

    /// Returns the tick info from the manager
    /// Parameters:
    /// - manager: reference to the tick manager
    /// - index: the index of the tick
    /// Returns:
    /// - The tick info for the given index
    public fun get_tick_from_manager(manager: &TickManager, index: I32) : &TickInfo {
        abort 0
    }   

    /// Returns the sqrt price of the tick
    /// Parameters:
    /// - tick: reference to the tick info
    /// Returns:
    /// - The sqrt price of the tick
    public fun sqrt_price(tick: &TickInfo) : u128 {
        abort 0
    }

    /// Creates a new tick info
    /// Parameters:
    /// - index: the index of the tick
    /// Returns:
    /// - The new tick info
    public fun create_tick(index: I32): TickInfo {
        abort 0
    }

    /// Returns the gross liquidity of the tick
    /// Parameters:
    /// - tick: reference to the tick info
    /// Returns:
    /// - The gross liquidity of the tick
    public fun liquidity_gross(tick: &TickInfo): u128 {
        abort 0
    }

    /// Returns the net liquidity of the tick
    /// Parameters:
    /// - tick: reference to the tick info
    /// Returns:
    /// - The net liquidity of the tick
    public fun liquidity_net(tick: &TickInfo): I128 {
        abort 0
    }

    /// Returns the tick spacing of the tick manager
    /// Parameters:
    /// - manager: reference to the tick manager
    /// Returns:
    /// - The tick spacing of the tick manager
    public fun tick_spacing(manager: &TickManager): u32 {
        abort 0
    }

    /// Returns the fee and reward growths inside the tick
    /// Parameters:
    /// - manager: reference to the tick manager
    /// - lower_tick_index: lower tick index
    /// - upper_tick_index: upper tick index
    /// - current_tick_index: current tick index
    /// - fee_growth_global_coin_a: fee growth global coin A
    public fun get_fee_and_reward_growths_inside(manager: &TickManager, lower_tick_index: I32, upper_tick_index: I32, current_tick_index: I32, fee_growth_global_coin_a: u128, fee_growth_global_coin_b: u128, reward_growths_global: vector<u128>) : (u128, u128, vector<u128>) {
        abort 0
    }

    /// Returns the fee and reward growths outside the tick
    /// Parameters:
    /// - manager: reference to the tick manager
    /// - tick_index: tick index
    /// Returns:
    /// - The fee and reward growths outside the tick
    public fun get_fee_and_reward_growths_outside(manager: &TickManager, tick_index: I32) : (u128, u128, vector<u128>) {
        abort 0
    }

    /// Returns true if the tick is initialized
    /// Parameters:
    /// - manager: reference to the tick manager
    /// - tick_index: tick index
    /// Returns:
    /// - true if the tick is initialized, false otherwise
    public fun is_tick_initialized(manager: &TickManager, tick_index: I32) : bool {
        abort 0
    }

    /// Returns the bitmap of the tick manager
    /// Parameters:
    /// - manager: reference to the tick manager
    /// Returns:
    /// - The bitmap of the tick manager
    public fun bitmap(manager: &TickManager ): &Table<I32, u256> {
        abort 0
    }   

    /// Fetches the tick info for the provided tick indices
    /// Parameters:
    /// - manager: reference to the tick manager
    /// - ticks: vector of tick indices
    /// Returns:
    /// - The tick info for the provided tick indices
    public fun fetch_provided_ticks(manager: &TickManager, ticks: vector<u32>): vector<TickInfo> {
       abort 0
    }

}