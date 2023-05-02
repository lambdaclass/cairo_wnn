use cairo_wnn::wnn_data::bloom_filters::load_bloom_filters;
use cairo_wnn::wnn_data::bloom_filters::BloomFilter;
use cairo_wnn::wnn_data::hash_values::load_hash_values;
use cairo_wnn::wnn_data::hash_values::HashValue;
use cairo_wnn::wnn_data::input::load_input;
use cairo_wnn::wnn_data::lookup_table::load_lookup_table;
use cairo_wnn::wnn_data::lookup_table::LookupTable;
use array::ArrayTrait;
use traits::TryInto;
use traits::Into;
use option::OptionTrait;
use box::BoxTrait;

#[test]
fn test_load_bloom_filters() {
    let mut bloom_filters: Array<BloomFilter> = load_bloom_filters();
    let bloom_filters = @(bloom_filters);
    let length: u32 = bloom_filters.len();
    assert(length == 56_u32, 'wrong amount of bloom filters');
}

#[test]
fn test_load_input() {
    let mut input: Array<u64> = load_input();
    let length: u32 = input.len();
    assert(length == 56_u32, 'incorrect length of input');
}

#[test]
fn test_load_hash_values() {
    let values: Array<HashValue> = load_hash_values();
    let length: u32 = values.len();
    assert(length == 56_u32, 'incorrect length of hash values');
}

#[test]
fn test_load_lookup_table() {
    let lookup_table: LookupTable = load_lookup_table();
}
