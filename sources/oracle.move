// Copyright (c) Seed Labs

#[allow(unused_field, unused_variable,unused_type_parameter, unused_mut_parameter)]
/// Oracle Module
module bluefin_spot::oracle {
    use integer_mate::i64::{I64};

    //===========================================================//
    //                           Structs                         //
    //===========================================================//


    struct ObservationManager has copy, drop, store {
        observations: vector<Observation>,
        observation_index: u64,  
        observation_cardinality: u64,  
        observation_cardinality_next: u64, 
    }

    struct Observation has copy, drop, store {
        timestamp: u64,
        tick_cumulative: I64,
        seconds_per_liquidity_cumulative: u256,
        initialized: bool,
    }    

}