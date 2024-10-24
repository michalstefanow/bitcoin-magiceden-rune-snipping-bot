// Copyright (c) Seed Labs

#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter)]
/// Gateway Module
/// This module is for interacting with the core protocol. There is no logic with in this module.
/// Exposes methods for front-end users to add/remove liquidity or close positions or perform swaps
/// If you are interacting through contracts, best not to use this module 
/// and use public methods from other modules like pool diretly 
module bluefin_spot::gateway {
    use sui::tx_context::{TxContext};
    use sui::coin::{Coin};
    use sui::clock::{Clock};
    use bluefin_spot::config::{GlobalConfig};
    use bluefin_spot::pool::{Pool};
    use bluefin_spot::position::{Position};

    //===========================================================//
    //                   Public Entry Methods                    //
    //===========================================================//

    /// Allows caller to create a pool on Bluefin spot
    /// Any one can invoke the method to create a pool. Note that the creator can only specify
    /// the fee bases points, the protocol fee % of the fee is fixed to 25% and can not be changed by the creator.
    /// 
    /// Parameters:
    /// - clock              : Sui clock object
    /// - pool_name          : The name of the pool. The convention used on bluefin spot is `CoinA-CoinB` 
    /// - pool_icon_url      : The url to image to be shown on the position NFT of the pool (can be empty as well `""`)
    /// - coin_a_symbol      : The symbol of coin A of the pool. The data is emitted and not stored on pool or the protocol
    /// - coin_a_decimals    : The number of decimals the Coin A has. The data is emitted and not stored on pool or the protocol 
    /// - coin_a_url         : The url of the coin A token metadata or icon or anything else a user creating the 
    ///                        pool might be interested in getting as part of the pool creation event. 
    ///                        The data is emitted and not stored on pool or the protocol
    /// - coin_b_symbol      : The symbol of coin B of the pool. The data is emitted and not stored on pool or the protocol
    /// - coin_b_decimals    : The number of decimals the Coin B has. The data is emitted and not stored on pool or the protocol
    /// - coin_a_url         : The url of the coin A token metadata or icon or anything else a user creating the 
    ///                        pool might be interested in getting as part of the pool creation event. 
    ///                        The data is emitted and not stored on pool or the protocol
    /// - tick_spacing       : An unsigned number representing the tick spacing supported by the pool
    /// - fee_basis_points   : The maount of fee the pool charges per swap. The fee is represented 
    ///                        in 1e6 format. 1 bips is 1e3, 2.5 bps is 2.5*1e3 and so on.
    /// - current_sqrt_price : The starting sqrt price of the pool
    /// - ctx                : Murable reference to caller's transaction context
    /// 
    /// Events Emitted       : PoolCreated
    public entry fun create_pool<CoinTypeA, CoinTypeB>(
        clock: &Clock, 
        pool_name: vector<u8>, 
        pool_icon_url: vector<u8>, 
        coin_a_symbol: vector<u8>, 
        coin_a_decimals: u8, 
        coin_a_url: vector<u8>, 
        coin_b_symbol: vector<u8>, 
        coin_b_decimals: u8, 
        coin_b_url: vector<u8>, 
        tick_spacing: u32, 
        fee_basis_points: u64, 
        current_sqrt_price: u128, 
        ctx: &mut TxContext){        
        abort 0
    }
    
    /// Allows caller to provide liquidity to a pool on exchange without specifying the 
    /// exact coin A or coin B amounts. 
    /// 
    /// Parameters:
    /// - clock              : Sui clock object
    /// - protocol_config    : The `config::GlobalConfig` object used for version verification
    /// - pool               : Mutable reference to the pool to which liquidity is to be provided
    /// - position           : The position to which the liquidity is being provided
    /// - coin_a             : The Coin A object. Should have the atleast `coin_a_min` amount
    /// - coin_b             : The Coin B object. Should have the atleast `coin_b_min` amount
    /// - coin_a_min         : The minimum amount of Coin A, the user wants to provide (Used for slippage check)
    /// - coin_b_min         : The minimum amount of Coin B, the user wants to provide (Used for slippage check)
    /// - liquidity          : The amount of liquidity to provide
    /// - ctx                : Murable reference to caller's transaction context
    /// 
    /// Events Emitted       : LiquidityProvided
    public entry fun provide_liquidity<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
        coin_a: Coin<CoinTypeA>,
        coin_b: Coin<CoinTypeB>,
        coin_a_min: u64,
        coin_b_min: u64,
        liquidity: u128, 
        ctx: &mut TxContext) {
        abort 0

    }

    /// Allows caller to provide liquidity to a pool on exchange with a fixed amount of eithee Coin A or Coin B
    /// The liquidity is computed based on the input amount
    /// 
    /// Parameters:
    /// - clock              : Sui clock object
    /// - protocol_config    : The `config::GlobalConfig` object used for version verification
    /// - pool               : Mutable reference to the pool to which liquidity is to be provided
    /// - position           : The position to which the liquidity is being provided
    /// - coin_a             : The Coin A object. Should have at max `coin_a_max` amount and min `amount`
    /// - coin_b             : The Coin A object. Should have at max `coin_b_max` amount and min `amount`
    /// - amount             : The amount of Coin A or Coin B to be provided
    /// - coin_a_max         : The maximum amount of Coin A, the user wants to provide (Used for slippage check)
    /// - coin_b_max         : The maximum amount of Coin B, the user wants to provide (Used for slippage check)
    /// - is_fixed_a         : True if the amount provided belongs to token A
    /// - ctx                : Murable reference to caller's transaction context
    /// 
    /// Events Emitted       : LiquidityProvided
    public entry fun provide_liquidity_with_fixed_amount<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
        coin_a: Coin<CoinTypeA>,
        coin_b: Coin<CoinTypeB>,
        amount: u64,
        coin_a_max: u64,
        coin_b_max: u64,
        is_fixed_a: bool,
        ctx: &mut TxContext) {
        abort 0

    }


    /// Allows caller to remove liquidity from a pool from given position. The input is the amount of liquidity
    /// user wants the remove. The coin A and coin B amounts are calculated by the core protocol 
    /// and sent to `destination` address
    /// 
    /// Parameters:
    /// - clock              : Sui clock object
    /// - protocol_config    : The `config::GlobalConfig` object used for version verification
    /// - pool               : Mutable reference to the pool on which the position exist
    /// - position           : The position from which the liquidity is to be removed
    /// - liquidity          : The amount of liquidity to remove
    /// - min_coins_a        : The minimum amount of Coin A, the user wants to receive (Used for slippage check)
    /// - min_coins_b        : The minimum amount of Coin B, the user wants to receive (Used for slippage check)
    /// - destination        : The address to which the withdrawn amounts of coin A & B are to be sent
    /// - ctx                : Murable reference to caller's transaction context
    /// 
    /// Events Emitted       : LiquidityRemoved
    public entry fun remove_liquidity<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: &mut Position,
        liquidity: u128, 
        min_coins_a: u64,
        min_coins_b: u64,
        destination: address,
        ctx: &mut TxContext) {
        abort 0
    }

    /// Allows caller to close their position. If there is any liquidity or fee accrued 
    /// in the position it will be withdrawn and sent to `destination`. The user must claim all pending rewards before 
    /// position closure. The method will revert otherwise.
    /// 
    /// Parameters:
    /// - clock              : Sui clock object
    /// - protocol_config    : The `config::GlobalConfig` object used for version verification
    /// - pool               : Mutable reference to the pool to pool on which the position is being closed
    /// - position           : The position to be closed
    /// - destination        : The address to which the withdrawn liquidity and fee of coin A & B are to be sent
    /// - ctx                : Murable reference to caller's transaction context
    /// 
    /// Events Emitted       : PositionClosed | LiquidityRemoved | UserFeeCollected
    public entry fun close_position<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        position: Position,
        destination: address,
        ctx: &mut TxContext) {
        abort 0
    }


    /// Allows caller to swap assets using the provided pool. The swapped amount is sent to the caller address
    /// 
    /// Parameters:
    /// - clock                 : Sui clock object
    /// - protocol_config       : The `config::GlobalConfig` object used for version verification
    /// - pool                  : Mutable reference to the pool on which to perform swap
    /// - coin_a                : The coin A object. It will be ZERO if swapping from b2a
    /// - coin_b                : The coin B object. It will be ZERO if swapping from a2b
    /// - a2b                   : True if direction of swap is from token A to B
    /// - by_amount_in          : True if the provided amount is the amount of input token
    /// - amount                : The input/output amount of token
    /// - amount_limit          : The max amount of input token to be used or the min amount of output tokens expected from swap
    /// - sqrt_price_max_limit  : The max price limit to hit during swap ( Max slippage )
    /// - ctx                   : Murable reference to caller's transaction context
    /// 
    /// Events Emitted          : AssetSwap
    public entry fun swap_assets<CoinTypeA, CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>, 
        coin_a: Coin<CoinTypeA>,
        coin_b: Coin<CoinTypeB>,
        a2b: bool,
        by_amount_in: bool,
        amount: u64,
        amount_limit: u64,
        sqrt_price_max_limit: u128,
        ctx: &mut TxContext) {
        abort 0
    }


    /// Allows user to collect the fees accruted on their position. 
    /// The fees for both coin A and B are collected and sent to user address
    /// 
    /// Parameters:
    /// - clock                 : Sui clock object
    /// - protocol_config       : The `config::GlobalConfig` object used for version verification
    /// - pool                  : Mutable reference to the pool on which the position exists
    /// - position              : The position for which the fee is to be collected
    /// - ctx                   : Murable reference to caller's transaction context
    /// 
    /// Events Emitted          : UserFeeCollected
    public entry fun collect_fee<CoinTypeA,CoinTypeB>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>,
        position: &mut Position,
        ctx: &mut TxContext) {
        abort 0
     }

    /// Allows user to collect the reward accrued on their position. Only the reward of provided `RewardCoinType` are collected
    /// The user must call this method separately for each reward coin they want to collect
    /// 
    /// Parameters:
    /// - clock                 : Sui clock object
    /// - protocol_config       : The `config::GlobalConfig` object used for version verification
    /// - pool                  : Mutable reference to the pool on which the position exists
    /// - position              : The position for which the rewards are to be collected
    /// - ctx                   : Murable reference to caller's transaction context
    /// 
    /// Events Emitted          : UserRewardCollected
     public fun collect_reward<CoinTypeA, CoinTypeB, RewardCoinType>(
        clock: &Clock,
        protocol_config: &GlobalConfig, 
        pool: &mut Pool<CoinTypeA, CoinTypeB>,
        position: &mut Position,
        ctx: &mut TxContext) {
        abort 0        
    }
}