use cairo_wnn::wnn_data::lookup_table::LookupTableTrait;
use core::clone::Clone;
use core::box::BoxTrait;
use core::option::OptionTrait;
use cairo_wnn::wnn_data::bloom_filters::load_bloom_filters;
use cairo_wnn::wnn_data::hash_values::load_hash_values;
use cairo_wnn::wnn_data::hash_values::HashValue;
use cairo_wnn::wnn_data::hash_values::HashValueTrait;
use cairo_wnn::wnn_data::hash_values::Decomposition;
use cairo_wnn::wnn_data::input::load_input;
use cairo_wnn::wnn_data::lookup_table;
use cairo_wnn::wnn_data::bloom_filters::arg_max;

use array::ArrayTrait;
use debug::PrintTrait;

fn _validate_all_hash(input: @Array<u64>, hash_values: @Array<HashValue>, index: u32) -> bool {
    
    if index == input.len() {
        return true;
    }

    let hash_value: HashValue = *hash_values[index];
    let input_i = *input[index];
    let validate_hash_result = hash_value.validate_hash(input_i);
    let decomposition_result = hash_value.validate_bit_decomposition();

    // Refactor after boolean operations are added
    if validate_hash_result == false {
        return false;
    }
    if decomposition_result == false {
        return false;
    }

    return _validate_all_hash(input, hash_values, index + 1);
}

fn validate_all_hash_value(input: @Array<u64>, hash_values: @Array<HashValue>) -> bool {
    assert(input.len() == hash_values.len(), 'should be the same length');
    _validate_all_hash(input, hash_values, 0)
}

fn infere_from_hash_value(
    hash_values: @Array<HashValue>, lookup_table: @lookup_table::LookupTable
) -> u128 {
    lookup_table.arg_max(hash_values)
}

#[test]
// #[available_gas(200000000000)]
// fn integration_test() {
//     let hash_values = load_hash_values();
//     // let input = load_input();
//     // let bloom_filters = load_bloom_filters();
//     // assert(validate_all_hash_value(@input, @hash_values) == true, 'should be true');

//     let lookup_table: lookup_table::LookupTable = lookup_table::load_lookup_table();
//     let infere_value = infere_hash_value(@hash_values, @lookup_table);
//     infere_value.print();
//     assert(infere_value == 7_u128, 'should be 7');

// }

#[test]
#[available_gas(200000000000)]
fn integration_test() {
    let hash_values = load_hash_values();
    let input = load_input();
    assert(validate_all_hash_value(@input, @hash_values) == true, 'should be true');
    // ToDo check lookup table
    let bloom_filters = load_bloom_filters();
    let (infer_value, max_outcome) = arg_max(bloom_filters);

    assert(infer_value == 7, 'should be 7');
    assert(max_outcome == 55, 'should be 55');
}

#[test]
fn test_validate_hash_value() {
    let mut hash_values = ArrayTrait::new();
    hash_values.append(
        HashValue {
            hash: 452966_felt252,
            quotient: 60938780181158238_felt252,
            decomposition: Decomposition {
                index1: 358_u32, index2: 442_u32, msb: 0_felt252, 
            },
        }
    );
    let mut input = ArrayTrait::<u64>::new();
    input.append(50370230_u64);

    let hash_value: HashValue = *hash_values.get(0).unwrap().unbox();
    let input_i = *input.get(0).unwrap().unbox();
    let validation = hash_value.validate_hash(input_i);
    assert(validation == true, 'should be true');
}

#[test]
fn test_validate_hash_bit_composition() {
    let hash_values = load_hash_values();

    let hash_value: HashValue = *hash_values.get(0).unwrap().unbox();
    let validation = hash_value.validate_bit_decomposition();
    assert(validation == true, 'should be true');
}
