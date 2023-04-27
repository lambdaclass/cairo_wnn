use debug::PrintTrait;
use array::ArrayTrait;
use traits::TryInto;
use traits::Into;
use core::option::OptionTrait;

fn _check_array_equality<T,
impl TPartialEq: PartialEq<T>,
impl TCopy: Copy<T>,
impl TDrop: Drop<T>>(
    a: @Array<T>, b: @Array<T>, i: u32
) -> bool {
    if i == a.len() {
        return true;
    }
    if *a[i] != *b[i] {
        return false;
    }
    _check_array_equality(a, b, i + 1_u32)
}

fn reverse_array<T, impl TPartialEq: PartialEq<T>, impl TCopy: Copy<T>, impl TDrop: Drop<T>, impl TPrintTrait: PrintTrait<T>>(arr: @Array<T>) -> Array<T> {
    let mut new_arr = ArrayTrait::<T>::new();
    let mut i = arr.len();
    loop {
        if i == 0_u32 {
            break ();
        }
        new_arr.append(*arr[i-1]);
        i -= 1_u32;
    };
    new_arr
}

fn check_array_equality<T, impl TPartialEq: PartialEq<T>, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(
    a: @Array<T>, b: @Array<T>
) -> bool {
    if a.len() != b.len() {
        return false;
    }
    let result = _check_array_equality(a, b, 0_u32);
    result
}

fn shift_u128_to_bits(ref num: u128, ref vec_bits: Array<u128>) {
    let mut div = 170141183460469231731687303715884105728_u128; // 2^127
    let mut i = 0_u128;
    loop {
        if i == 128 {
            break ();
        }
        let _bit = (num / div) & 1_u128;
        // Todo make this something not as horrible as this!
        // let bit: u8 =
            // _bit.try_into().unwrap().try_into().unwrap().try_into().unwrap().try_into().unwrap();
        vec_bits.append(_bit);
        num = (num % div) * 2_u128;
        div = div / 2_u128;
        i += 1;
    };
}

fn bits_to_u128(vec_bits: @Array<u128>) -> u128 {
    let mut num = 0_u128;
    let mut div = 1_u128;
    let mut i = 0_u32;
    loop {
        if i == 128 {
            break ();
        }
        let bit = *vec_bits[i];
        num = num + (bit * div);
        div = div * 2_u128;
        i += 1;
    };
    num
}

fn _shift_array_to_bits(ref num: Array<u128>, idx: u32, ref vec_bits: Array<u128>) {
    if idx >= num.len() {
        return ();
    }
    let mut current_value = *num[idx];
    shift_u128_to_bits(ref current_value, ref vec_bits);
    _shift_array_to_bits(ref num, idx + 1, ref vec_bits);
}

fn shift_array_to_bits(ref num: Array<u128>) -> Array<u128> {
    let mut vec_bits = ArrayTrait::<u128>::new();
    _shift_array_to_bits(ref num, 0, ref vec_bits);
    reverse_array(@vec_bits)
}
