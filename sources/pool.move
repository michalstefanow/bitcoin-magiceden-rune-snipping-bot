// Copyright (c) Seed Labs

#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter)]
/// Module for managing a position
module bluefin_spot::pool {
    use sui::object::{UID, ID};
    use sui::balance::{Balance};
    use sui::tx_context::{TxContext};
    use std::string::{String};
    use sui::clock::{Clock};
    use bluefin_spot::config::{GlobalConfig};
    use bluefin_spot::position::{Position};
    use bluefin_spot::tick::{TickManager};
    use bluefin_spot::oracle::{ObservationManager};
    use integer_mate::i32::{I32};
    

    //===========================================================//
    //                           Structs                         //
    //===========================================================//

    /// Represents a pool
    struct Pool<phantom CoinTypeA, phantom CoinTypeB> has key, store {
        // Id of the pool
        id: UID,
        // The name of the pool
        name: String,
        // Amount of Coin A locked in pool
        coin_a: Balance<CoinTypeA>,
        // Amount of Coin B locked in pool
        coin_b: Balance<CoinTypeB>,
        // The fee in basis points. 1 bps is represented as 100, 5 as 500
        fee_rate: u64,
        // the percentange of fee that will go to protocol
        protocol_fee_share: u64,        
        // Variable to track the fee accumulated in coin A 
        fee_growth_global_coin_a: u128,
        // Variable to track the fee accumulated in coin B 
        fee_growth_global_coin_b: u128,
        // Variable to track the accrued protocol fee of coin A
        protocol_fee_coin_a: u64,
        // Variable to track the accrued protocol fee of coin B
        protocol_fee_coin_b: u64,
        // The tick manager
        ticks_manager: TickManager,
        // The observations manager
        observations_manager: ObservationManager,
        // Current sqrt(P) in Q96 notation
        current_sqrt_price: u128,
        // The current tick index
        current_tick_index: I32,
        // The amount of liquidity (L) in the pool currently
        liquidity: u128,
        // Vector holding the information for different pool rewards
        reward_infos: vector<PoolRewardInfo>,
        // Is the pool paused
        is_paused: bool,
        // url of the pool logo
        icon_url: String,
        // position index number
        position_index: u128,
        // a incrementer, updated every time pool state is changed
        sequence_number: u128,
    }

    /// Represents reward configs inside a pool
    struct PoolRewardInfo has copy, drop, store {
        // symbol of reward coin
        reward_coin_symbol: String,
        // decimals of the reward coin
        reward_coin_decimals: u8,
        // type string of the reward coin
        reward_coin_type: String,
        // last time the data of this coin was changed.
        last_update_time: u64, 
        //timestamp at which the rewards will finish
        ended_at_seconds: u64,  
        // total coins to be emitted 
        total_reward: u64, 
        // total reward collectale at the moment 
        total_reward_allocated: u64, 
        // amount of reward to be emitted per second
        reward_per_seconds: u128, 
        // global values used to ditribute rewards
        reward_growth_global: u128, 
    }

    /// Represents a swap result
    struct SwapResult has copy, drop {
        a2b: bool,
        by_amount_in: bool,
        amount_specified: u64,
        amount_specified_remaining: u64,
        amount_calculated: u64,
        fee_growth_global: u128,
        fee_amount: u64,
        protocol_fee: u64,
        start_sqrt_price: u128,
        end_sqrt_price: u128,
        current_tick_index: I32,
        is_exceed: bool,
        starting_liquidity: u128,
        liquidity: u128,
        steps: u64,
        step_results: vector<SwapStepResult>,
    }

    struct SwapStepResult has copy, drop, store {
        tick_index_next: I32,
        initialized: bool,
        sqrt_price_start: u128,
        sqrt_price_next: u128,
        amount_in: u64,
        amount_out: u64,
        fee_amount: u64,
        remaining_amount: u64,
    }


    struct FlashSwapReceipt<phantom CoinTypeA, phantom CoinTypeB> {
        pool_id: ID,
        a2b: bool,
        pay_amount: u64,
    }



    //===========================================================//
    //                     Friend Functions                      //
    //===========================================================//


    public (friend) fun add_reward_info<CoinTypeA, CoinTypeB, RewardCoinType>(
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        pool_reward_info: PoolRewardInfo) {
            abort 0
        }

    public(friend) fun update_pool_reward_emission<CoinTypeA, CoinTypeB, RewardCoinType>(
        pool: &mut Pool<CoinTypeA, CoinTypeB>,
        balance: Balance<RewardCoinType>,
        active_for_secnds: u64,
        blue_reward_amount: u64,
        is_blue_reward: bool,
        ) {
       
       abort 0
    }

    public(friend) fun update_reward_infos<CoinTypeA, CoinTypeB>(pool: &mut Pool<CoinTypeA, CoinTypeB>, current_timestamp_seconds: u64) : vector<u128> {
       abort 0
    }


    //===========================================================//
    //                      Public Functions                     //
    //===========================================================//
    
    /// Creates a new pool for provided coins
    public fun new<CoinTypeA, CoinTypeB>(
        clock: &Clock, 
        pool_name: vector<u8>, 
        icon_url: vector<u8>,
        coin_a_symbol: vector<u8>, 
        coin_a_decimals: u8, 
        coin_a_url: vector<u8>, 
        coin_b_symbol: vector<u8>, 
        coin_b_decimals: u8, 
        coin_b_url: vector<u8>, 
        tick_spacing: u32,
        fee_rate: u64,
        current_sqrt_price: u128,
        ctx: &mut TxContext
        ) {

        abort 0
    }

    public fun add_liquidity_with_fixed_amount<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig,
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
        balance_a: Balance<CoinTypeA>,
        balance_b: Balance<CoinTypeB>,
        amount: u64,
        is_fixed_a: bool,
    ) : (u64, u64, Balance<CoinTypeA>, Balance<CoinTypeB>) {

        abort 0
    }

    public fun add_liquidity<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig,
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
        balance_a: Balance<CoinTypeA>,
        balance_b: Balance<CoinTypeB>,
        liquidity: u128,
    ) : (u64, u64, Balance<CoinTypeA>, Balance<CoinTypeB>) {
        
        abort 0
    }

    public fun remove_liquidity<CoinTypeA, CoinTypeB>(
        protocol_config: &GlobalConfig,
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
        liquidity: u128,
        clock: &Clock,
    ) : (u64, u64, Balance<CoinTypeA>, Balance<CoinTypeB>) {
        
        abort 0
    }

    /// Performs a swap on the pool
    public fun swap<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        balance_a: Balance<CoinTypeA>,
        balance_b: Balance<CoinTypeB>,
        a2b: bool,
        by_amount_in:bool,
        amount: u64,
        amount_limit: u64,
        sqrt_price_max_limit: u128,
    ): (Balance<CoinTypeA>, Balance<CoinTypeB>) {

        abort 0

    }

    public fun calculate_swap_results<CoinTypeA, CoinTypeB>(
        pool: &Pool<CoinTypeA, CoinTypeB>,
        a2b: bool,
        by_amount_in: bool,
        amount:u64, sqrt_price_max_limit: u128): SwapResult {

        abort 0
    }

    public fun repay_flash_swap<CoinTypeA, CoinTypeB>(protocol_config: &GlobalConfig, pool: &mut Pool<CoinTypeA, CoinTypeB>, coin_a: Balance<CoinTypeA>, coin_b: Balance<CoinTypeB>, receipt: FlashSwapReceipt<CoinTypeA, CoinTypeB>) {

        abort 0

    } 

    /// Collect the accrued fee in position
    public fun collect_fee<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig,
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
    ):( u64, u64, Balance<CoinTypeA>, Balance<CoinTypeB>){
        
        abort 0

    }

    public fun collect_reward<CoinTypeA, CoinTypeB, RewardCoinType>(
        clock: &Clock,
        protocol_config: &GlobalConfig,
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
    ) : Balance<RewardCoinType> {

        abort 0

    }

    /// Returns the amount to be paid for the flash swap
    public fun swap_pay_amount<CoinTypeA, CoinTypeB>(receipt: &FlashSwapReceipt<CoinTypeA, CoinTypeB>) : u64 {
        receipt.pay_amount
    }

    public fun get_pool_manager<CoinTypeA, CoinTypeB>(pool: &Pool<CoinTypeA, CoinTypeB>): address {
        abort 0
    }

    /// Returns the accrued protocol fee for coin A
    public fun get_protocol_fee_for_coin_a<CoinTypeA, CoinTypeB>(pool: &Pool<CoinTypeA, CoinTypeB>): u64 {
        pool.protocol_fee_coin_a
    }

    /// Returns the accrued protocol fee for coin B
    public fun get_protocol_fee_for_coin_b<CoinTypeA, CoinTypeB>(pool: &Pool<CoinTypeA, CoinTypeB>): u64 {
        pool.protocol_fee_coin_b
    }

    public fun open_position<CoinTypeA, CoinTypeB>(
        protocol_config: &GlobalConfig,
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        lower_tick_bits: u32, 
        upper_tick_bits: u32, 
        ctx: &mut TxContext): Position {

        abort 0

    }

    public fun close_position<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig,
        pool: &mut Pool<CoinTypeA, CoinTypeB>,
        position: Position): (Balance<CoinTypeA>, Balance<CoinTypeB>) {

        abort 0

    }    

    public fun liquidity<CoinTypeA, CoinTypeB>(
        pool: &Pool<CoinTypeA, CoinTypeB>
    ): u128 {
        pool.liquidity
    }

    public fun current_sqrt_price<CoinTypeA, CoinTypeB>(
        pool: &Pool<CoinTypeA, CoinTypeB>
    ): u128 {
        pool.current_sqrt_price
    }

    public fun current_tick_index<CoinTypeA, CoinTypeB>(
        pool: &Pool<CoinTypeA, CoinTypeB>
    ): I32 {
        pool.current_tick_index
    }

    public fun sequence_number<CoinTypeA, CoinTypeB>(
        pool: &Pool<CoinTypeA, CoinTypeB>
    ): u128 {
        pool.sequence_number
    }

    public fun verify_pool_manager<CoinTypeA, CoinTypeB>(pool: &Pool<CoinTypeA, CoinTypeB>, manager: address): bool {

        abort 0

    }

    public fun coin_reserves<CoinTypeA, CoinTypeB> (pool: &Pool<CoinTypeA, CoinTypeB>): (u64, u64){
        abort 0
    }
}
