use cairo_wnn::wnn_data::bloom_filters::Discriminators;
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
    let mut discriminators: Discriminators = load_bloom_filters();
    let bloom_filters = @(discriminators.bloom_filters);
    let length: u32 = bloom_filters.len();
    assert(length == discriminators.amount_layers, 'discriminator wrong num layers');
    let input1 = (bloom_filters.get(0_u32).unwrap().unbox());
    let length: u32 = input1.filters.len();
    assert(length == discriminators.amount_bits, 'bloomfilter incorrect num bits');
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
