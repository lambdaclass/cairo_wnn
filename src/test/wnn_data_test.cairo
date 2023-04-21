use cairo_wnn::wnn_data::bloom_filters::load_bloom_filters;
use cairo_wnn::wnn_data::hash_values::load_hash_values;
use cairo_wnn::wnn_data::hash_values::HashValue;
use cairo_wnn::wnn_data::input::load_input;
use array::ArrayTrait;
use traits::TryInto;
use traits::Into;
use option::OptionTrait;
use box::BoxTrait;

#[test]
fn test_load_bloom_filters() {
    let mut bloom_filters: Array<Array<u64>> = load_bloom_filters();
    let length: u32 = bloom_filters.len();
    assert(length == 56_u32, 'incorrect length1');
    let input1 = bloom_filters.pop_front().unwrap();
    let length = input1.len();
    assert(length == 20_u32, 'incorrect length2');
}

#[test]
fn test_load_input() {
    let mut input: Array<u64> = load_input();
    let length: u32 = input.len();
    assert(length == 56_u32, 'incorrect length1');
}

#[test]
fn test_load_hash_values() {
    let values: Array<HashValue> = load_hash_values();
    let length: u32 = values.len();
    assert(length == 56_u32, 'incorrect length1');
}
