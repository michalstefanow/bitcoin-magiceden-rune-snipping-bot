#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter)]
/// Events Module
/// The module is responsible fro emitting all the events of the protocol
/// All events struct could be found be found here
module bluefin_spot::events {
    use sui::object::ID;
    use std::string::{String};
    use integer_mate::i32::{I32};

    /// Emitted when a pool is created using `pool::new`
    struct PoolCreated has copy, drop {
        /// The id of the pool
        id: ID,
        /// The coin A type name `address::module::struct`
        coin_a: String,
        /// The coin A symbol
        coin_a_symbol: String, 
        /// The Coin A Decimals
        coin_a_decimals: u8, 
        /// The Coin A metadata/project url
        coin_a_url: String, 
        /// The coin B type name `address::module::struct`
        coin_b: String,
        /// The coin B symbol
        coin_b_symbol: String, 
        /// The coin B Decimals
        coin_b_decimals: u8, 
        /// The coin B metadata/project url
        coin_b_url: String, 
        /// The current sqrt price of the pool
        current_sqrt_price: u128,
        /// The currrent tick index of the pool
        current_tick_index: I32,
        /// The tick spacing supported by the pool
        tick_spacing: u32,
        /// The swap fee rate. Represented in 1e6
        fee_rate: u64, 
        /// The protcol percentage of the fee. Represented in 1e6
        protocol_fee_share: u64
    }

    /// Emitted when a position is opened using `pool::open_position` method
    struct PositionOpened has copy, drop {
        /// The id of the pool to which the position belongs to
        pool_id: ID,
        /// The id of the position
        position_id: ID,
        /// The lower tick bits
        tick_lower: I32,
        /// The upper tick bits
        tick_upper: I32
    }

    /// Emitted when a position is closed using `pool::close_position` method
    struct PositionClosed has copy, drop {
        /// The id of the pool to which the position belongs to
        pool_id: ID,
        /// The id of the position
        position_id: ID,
        /// The lower tick bits
        tick_lower: I32,
        /// The upper tick bits
        tick_upper: I32
    }


    /// Emitted when assets are swapped on a pool using `pool::swap` method
    struct AssetSwap has copy, drop {
        /// ID of the pool on which swap was performed
        pool_id: ID,
        /// The direction of swap
        a2b: bool,
        /// The amount of input coins deposited to the pool
        amount_in: u64,
        /// The amount of output coins withdrawn from pool
        amount_out: u64,
        /// The total amount of coin A in pool after the action
        pool_coin_a_amount: u64,
        /// The total amount of coin B in pool after the action
        pool_coin_b_amount: u64,
        /// The amount of fee paid for the swap. It is in the base of the input coin
        fee: u64,
        /// The liquidity on the pool before swap
        before_liquidity: u128,
        /// The liquidity on the pool after swap
        after_liquidity: u128,
        /// The sqrt price of the pool before swap
        before_sqrt_price: u128,
        /// The sqrt price of the pool after swap
        after_sqrt_price: u128,
        /// The current tick of the pool after swap
        current_tick: I32,
        /// True if the entire input amount could not be swapped
        exceeded: bool,
        /// The sequence/action number of the pool after swap
        sequence_number: u128
    }

    /// Emitted when a flash swap is performed on a pool using `pool::flash_swap` method
    struct FlashSwap has copy, drop {
        /// ID of the pool on which swap was performed
        pool_id: ID,
        /// The direction of swap
        a2b: bool,
        /// The amount of input coins deposited to the pool
        amount_in: u64,
        /// The amount of output coins withdrawn from pool
        amount_out: u64,
        /// The total amount of coin A in pool after the action
        pool_coin_a_amount: u64,
        /// The total amount of coin B in pool after the action
        pool_coin_b_amount: u64,
        /// The amount of fee paid for the swap. It is in the base of the input coin
        fee: u64,
        /// The liquidity on the pool before swap
        before_liquidity: u128,
        /// The liquidity on the pool after swap
        after_liquidity: u128,
        /// The sqrt price of the pool before swap
        before_sqrt_price: u128,
        /// The sqrt price of the pool after swap
        after_sqrt_price: u128,
        /// The current tick of the pool after swap
        current_tick: I32,
        /// True if the entire input amount could not be swapped
        exceeded: bool,
        /// The sequence number of the pool after the action
        sequence_number: u128
    }

    /// Emitted when protocol's portion of the fee is withdrawn using `admin::claim_protocol_fee` method
    struct ProtocolFeeCollected has copy, drop {
        /// ID of the pool from which the protocol fee share was withdrawn
        pool_id: ID,
        /// The address of the withdrawer
        sender: address,
        /// The address to which withdrawn fee amount was sent
        destination: address,
        /// The amount of coin A withdrawn
        coin_a_amount: u64,
        /// The amount of coin B withdrawn
        coin_b_amount: u64,
        /// The total amount of coin A in pool after the action
        pool_coin_a_amount: u64,
        /// The total amount of coin B in pool after the action
        pool_coin_b_amount: u64,
        /// The sequence number of the pool after the action
        sequence_number: u128
    }

    /// Emitted when a user collects the accrued fee on their position using `pool::collect_fee` method
    struct UserFeeCollected has copy, drop {
        /// ID of the pool from which the fee was collected
        pool_id: ID,
        /// ID of the position for which fee was collected
        position_id: ID,
        /// The amount of coin A fee collected
        coin_a_amount: u64,
        /// The amount of coin B fee collected
        coin_b_amount: u64,
        /// The total amount of coin A in pool after the action
        pool_coin_a_amount: u64,
        /// The total amount of coin B in pool after the action
        pool_coin_b_amount: u64,
        /// The sequence number of the pool after the action
        sequence_number: u128

    }

    /// Emitted when a user collects the accrued rewards on their position using `pool::collect_reward` method
    struct UserRewardCollected has copy, drop {
        /// ID of the pool from which the rewards were collected
        pool_id: ID,
        /// ID of the position for which rewards were collected
        position_id: ID,
        /// The type of rewards `0xaddress::module::struct`
        reward_type: String,
        /// The symbol fo reward coin
        reward_symbol: String,
        /// The number of decimals, the reward coin supports
        reward_decimals: u8,
        /// The amount of rewards collected
        reward_amount: u64,
        /// The sequence number of the pool after the action
        sequence_number: u128
    }


    /// Emitted when a user provides liquidity to the pool using 
    /// `pool::add_liquidity_with_fixed_amount` or `pool::add_liquidity`
    struct LiquidityProvided has copy, drop {
        /// The ID of the pool to which liquidity was provided
        pool_id: ID,
        /// The ID of the position that provided the liquidity
        position_id: ID, 
        /// The amount of Coin A provided
        coin_a_amount: u64, 
        /// The amount of Coin B provided
        coin_b_amount: u64,
        /// The total amount of coin A in pool after the action
        pool_coin_a_amount: u64,
        /// The total amount of coin B in pool after the action
        pool_coin_b_amount: u64,
        /// The amount of liquidity provided
        liquidity: u128, 
        /// The liquidity of the pool before the action
        before_liquidity: u128, 
        /// The liquidity of the pool after the action
        after_liquidity: u128,
        /// The current price of the pool
        current_sqrt_price: u128,
        /// The current tick index of the pool
        current_tick_index: I32,
        /// The lower tick of the position 
        lower_tick: I32,
        /// The upper tick of the position 
        upper_tick: I32,
        /// The sequence number of the pool after the action
        sequence_number: u128

    }

    ///  Emitted when a user removes liquidity to the pool using 
    /// `pool::remove_liquidity`
    struct LiquidityRemoved has copy, drop {
        /// The ID of the pool to which liquidity was provided
        pool_id: ID,
        /// The ID of the position that provided the liquidity
        position_id: ID, 
        /// The amount of Coin A provided
        coin_a_amount: u64, 
        /// The amount of Coin B provided
        coin_b_amount: u64,
        /// The total amount of coin A in pool after the action
        pool_coin_a_amount: u64,
        /// The total amount of coin B in pool after the action
        pool_coin_b_amount: u64,
        /// The amount of liquidity provided
        liquidity: u128, 
        /// The liquidity of the pool before the action
        before_liquidity: u128, 
        /// The liquidity of the pool after the action
        after_liquidity: u128,
        /// The current price of the pool
        current_sqrt_price: u128,
        /// The current tick index of the pool
        current_tick_index: I32,
        /// The lower tick of the position 
        lower_tick: I32,
        /// The upper tick of the position 
        upper_tick: I32,
        /// The sequence number of the pool after the action
        sequence_number: u128
    }

    ///  Emitted when a user provides liquidity to the pool using 
    /// `admin::initialize_pool_reward` or 
    /// `admin::update_pool_reward_emission` or 
    /// `admin::add_seconds_to_reward_emission`
    struct UpdatePoolRewardEmissionEvent has copy, drop {
        /// ID of the pool for which rewards are updated
        pool_id: ID,
        /// The symbol do the reward coin
        reward_coin_symbol: String,
        /// The type `0xaddress::module::struct` of reward coin
        reward_coin_type: String,
        /// The number of decimals the reward coin supports
        reward_coin_decimals: u8,
        /// The amount of rewards provided
        total_reward: u64,
        /// The timestamp at which rewards will end
        ended_at_seconds: u64,
        /// The time at which time reward were last updated (current time of the call)
        last_update_time: u64,
        /// The amount of rewards that will be emitted per second
        reward_per_seconds: u128,
        /// The sequence number of the pool after the action
        sequence_number: u128
    }


}