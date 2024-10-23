// Copyright (c) Seed Labs

#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter)]
/// Constants Module
/// Exposes public methods to get constant values used across the protocol
module bluefin_spot::constants {
     use std::string::{String};

    /// Default (25%) protocol fee share of total fee rate
    /// The protocol fee is in 1e6 base
    /// The admin of the protcool can choose to reduce protocol fee rate for a specific pool
    const PROTOCOL_FEE_SHARE: u64 = 250000;
    
    const Q64: u128 = 18446744073709551616;

    const MAX_U8: u8 = 0xff;

    const MAX_U16: u16 = 0xffff;

    const MAX_U32: u32 = 0xffffffff;

    const MAX_U64: u64 = 0xfffffffffffffff;

    const MAX_U128: u128 = 0xffffffffffffffffffffffffffffffff;

    const MAX_U256: u256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    //===========================================================//
    //                        Getter Nethods                     //
    //===========================================================//


    public fun protocol_fee_share(): u64 {
        PROTOCOL_FEE_SHARE
    }

    public fun q64() : u128 {
        Q64
    }

    public fun max_u8(): u8 {
        MAX_U8
    }

    public fun max_u16(): u16 {
        MAX_U16
    }

    public fun max_u32(): u32 {
        MAX_U32
    }

    public fun max_u64(): u64 {
        MAX_U64
    }

    public fun max_u128(): u128 {
        MAX_U128
    }

    public fun max_u256(): u256 {
        MAX_U256
    }

    public fun manager(): String {
         abort 0
    }

    public fun blue_reward_type(): String {
         abort 0
    }
}

