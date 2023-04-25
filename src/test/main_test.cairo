use core::clone::Clone;
use core::box::BoxTrait;
use core::option::OptionTrait;
use cairo_wnn::wnn_data::bloom_filters::Discriminators;
use cairo_wnn::wnn_data::bloom_filters::load_bloom_filters;
use cairo_wnn::wnn_data::hash_values::load_hash_values;
use cairo_wnn::wnn_data::hash_values::HashValue;
use cairo_wnn::wnn_data::hash_values::HashValueTrait;
use cairo_wnn::wnn_data::hash_values::Decomposition;
use cairo_wnn::wnn_data::input::load_input;
use array::ArrayTrait;
use debug::PrintTrait;

fn _validate_all_hash(input: @Array<u64>, hash_values: @Array<HashValue>, index: u32) -> bool {
    if index == input.len() {
        return true;
    }

    let hash_value: HashValue = *hash_values.get(index).unwrap().unbox();
    let input_i = *input.get(index).unwrap().unbox();
    let result = hash_value.validate_hash(input_i);

    if result == false {
        return false;
    }

    return _validate_all_hash(input, hash_values, index + 1);
}

fn validate_all_hash(input: @Array<u64>, hash_values: @Array<HashValue>) -> bool {
    assert(input.len() == hash_values.len(), 'should be the same length');
    _validate_all_hash(input, hash_values, 0)
}

#[test]
#[available_gas(20000000000)]
fn integration_test() {
    let hash_values = load_hash_values();
    let input = load_input();
    assert(validate_all_hash(@input, @hash_values) == true, 'should be true');
}

#[test]
fn test_validate() {
    let mut hash_values = ArrayTrait::new();
    hash_values.append(
        HashValue {
            hash: 452966_felt252,
            quotient: 60938780181158238_felt252,
            decomposition: Decomposition {
                index1: 358_felt252, index2: 442_felt252, msb: 0_felt252, 
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
