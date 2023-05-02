use core::option::OptionTrait;
use cairo_wnn::extended_lib;
use array::ArrayTrait;
use debug::PrintTrait;
use traits::Into;

#[test]
#[available_gas(20000000000)]
fn test_check_array_equality_should_be_true() {
    let mut a: Array<u8> = ArrayTrait::<u8>::new();
    let mut b: Array<u8> = ArrayTrait::<u8>::new();

    a.append(1_u8);
    a.append(2_u8);
    a.append(3_u8);
    b.append(1_u8);
    b.append(2_u8);
    b.append(3_u8);

    let result: bool = extended_lib::check_array_equality(@a, @b);
    assert(result == true, 'arrays should be equal');
}

#[test]
#[available_gas(20000000000)]
fn test_check_array_equality_should_be_false() {
    let mut a: Array<u8> = ArrayTrait::<u8>::new();
    let mut b: Array<u8> = ArrayTrait::<u8>::new();

    a.append(1_u8);
    a.append(2_u8);
    a.append(3_u8);
    b.append(1_u8);
    b.append(10_u8);
    b.append(30_u8);

    let result: bool = extended_lib::check_array_equality(@a, @b);
    assert(result == false, 'arrays not should be equal');
}

#[test]
#[available_gas(20000000000)]
fn test_check_array_equality_should_be_false_with_different_length() {
    let mut a: Array<u8> = ArrayTrait::<u8>::new();
    let mut b: Array<u8> = ArrayTrait::<u8>::new();

    a.append(1_u8);
    a.append(2_u8);
    a.append(3_u8);
    b.append(1_u8);
    b.append(2_u8);
    b.append(3_u8);
    b.append(4_u8);

    let result: bool = extended_lib::check_array_equality(@a, @b);
    assert(result == false, 'arrays not should be equal');
}

#[test]
#[available_gas(20000000000)]
fn test_reverse_array() {
    let mut a: Array<u8> = ArrayTrait::<u8>::new();
    a.append(1_u8);
    a.append(2_u8);
    a.append(3_u8);
    a.append(4_u8);
    a.append(5_u8);
    a.append(6_u8);
    a.append(7_u8);

    let mut a_reverse: Array<u8> = extended_lib::reverse_array(@a);
    assert(a_reverse.len() == 7_u32, 'array length should be 7');
    assert(*a_reverse[0_u32] == 7_u8, 'array[0] should be 7');
    assert(*a_reverse[1_u32] == 6_u8, 'array[1] should be 6');
    assert(*a_reverse[2_u32] == 5_u8, 'array[2] should be 5');
    assert(*a_reverse[3_u32] == 4_u8, 'array[3] should be 4');
    assert(*a_reverse[4_u32] == 3_u8, 'array[4] should be 3');
    assert(*a_reverse[5_u32] == 2_u8, 'array[5] should be 2');
    assert(*a_reverse[6_u32] == 1_u8, 'array[6] should be 1');
}


#[test]
#[available_gas(20000000000)]
fn test_u128_to_bits() {
    let mut num = 446539134253285528697935237820190784_u128;
    let mut bits: Array<u128> = ArrayTrait::<u128>::new();
    extended_lib::shift_u128_to_bits(ref num, ref bits);
    assert(bits.len() == 128, 'bits length should be 128');
    assert(*bits[0] == 0_u128, 'bits[0] == 0_u128');
    assert(*bits[1] == 0_u128, 'bits[1] == 0_u128');
    assert(*bits[2] == 0_u128, 'bits[2] == 0_u128');
    assert(*bits[3] == 0_u128, 'bits[3] == 0_u128');
    assert(*bits[4] == 0_u128, 'bits[4] == 0_u128');
    assert(*bits[5] == 0_u128, 'bits[5] == 0_u128');
    assert(*bits[6] == 0_u128, 'bits[6] == 0_u128');
    assert(*bits[7] == 0_u128, 'bits[7] == 0_u128');
    assert(*bits[8] == 0_u128, 'bits[8] == 0_u128');
    assert(*bits[9] == 1_u128, 'bits[9] == 1_u128');
    assert(*bits[10] == 0_u128, 'bits[10] == 0_u128');
    assert(*bits[11] == 1_u128, 'bits[11] == 1_u128');
    assert(*bits[12] == 0_u128, 'bits[12] == 0_u128');
    assert(*bits[13] == 1_u128, 'bits[13] == 1_u128');
    assert(*bits[14] == 1_u128, 'bits[14] == 1_u128');
    assert(*bits[15] == 0_u128, 'bits[15] == 0_u128');
    assert(*bits[16] == 0_u128, 'bits[16] == 0_u128');
    assert(*bits[17] == 0_u128, 'bits[17] == 0_u128');
    assert(*bits[18] == 0_u128, 'bits[18] == 0_u128');
    assert(*bits[19] == 0_u128, 'bits[19] == 0_u128');
    assert(*bits[20] == 0_u128, 'bits[20] == 0_u128');
    assert(*bits[21] == 0_u128, 'bits[21] == 0_u128');
    assert(*bits[22] == 0_u128, 'bits[22] == 0_u128');
    assert(*bits[23] == 0_u128, 'bits[23] == 0_u128');
    assert(*bits[24] == 0_u128, 'bits[24] == 0_u128');
    assert(*bits[25] == 0_u128, 'bits[25] == 0_u128');
    assert(*bits[26] == 0_u128, 'bits[26] == 0_u128');
    assert(*bits[27] == 1_u128, 'bits[27] == 1_u128');
    assert(*bits[28] == 0_u128, 'bits[28] == 0_u128');
    assert(*bits[29] == 1_u128, 'bits[29] == 1_u128');
    assert(*bits[30] == 0_u128, 'bits[30] == 0_u128');
    assert(*bits[31] == 0_u128, 'bits[31] == 0_u128');
    assert(*bits[32] == 0_u128, 'bits[32] == 0_u128');
    assert(*bits[33] == 1_u128, 'bits[33] == 1_u128');
    assert(*bits[34] == 0_u128, 'bits[34] == 0_u128');
    assert(*bits[35] == 0_u128, 'bits[35] == 0_u128');
    assert(*bits[36] == 0_u128, 'bits[36] == 0_u128');
    assert(*bits[37] == 0_u128, 'bits[37] == 0_u128');
    assert(*bits[38] == 0_u128, 'bits[38] == 0_u128');
    assert(*bits[39] == 0_u128, 'bits[39] == 0_u128');
    assert(*bits[40] == 0_u128, 'bits[40] == 0_u128');
    assert(*bits[41] == 0_u128, 'bits[41] == 0_u128');
    assert(*bits[42] == 1_u128, 'bits[42] == 1_u128');
    assert(*bits[43] == 0_u128, 'bits[43] == 0_u128');
    assert(*bits[44] == 1_u128, 'bits[44] == 1_u128');
    assert(*bits[45] == 0_u128, 'bits[45] == 0_u128');
    assert(*bits[46] == 0_u128, 'bits[46] == 0_u128');
    assert(*bits[47] == 0_u128, 'bits[47] == 0_u128');
    assert(*bits[48] == 1_u128, 'bits[48] == 1_u128');
    assert(*bits[49] == 0_u128, 'bits[49] == 0_u128');
    assert(*bits[50] == 0_u128, 'bits[50] == 0_u128');
    assert(*bits[51] == 0_u128, 'bits[51] == 0_u128');
    assert(*bits[52] == 1_u128, 'bits[52] == 1_u128');
    assert(*bits[53] == 0_u128, 'bits[53] == 0_u128');
    assert(*bits[54] == 0_u128, 'bits[54] == 0_u128');
    assert(*bits[55] == 0_u128, 'bits[55] == 0_u128');
    assert(*bits[56] == 0_u128, 'bits[56] == 0_u128');
    assert(*bits[57] == 0_u128, 'bits[57] == 0_u128');
    assert(*bits[58] == 0_u128, 'bits[58] == 0_u128');
    assert(*bits[59] == 0_u128, 'bits[59] == 0_u128');
    assert(*bits[60] == 1_u128, 'bits[60] == 1_u128');
    assert(*bits[61] == 0_u128, 'bits[61] == 0_u128');
    assert(*bits[62] == 0_u128, 'bits[62] == 0_u128');
    assert(*bits[63] == 0_u128, 'bits[63] == 0_u128');
    assert(*bits[64] == 1_u128, 'bits[64] == 1_u128');
    assert(*bits[65] == 1_u128, 'bits[65] == 1_u128');
    assert(*bits[66] == 1_u128, 'bits[66] == 1_u128');
    assert(*bits[67] == 0_u128, 'bits[67] == 0_u128');
    assert(*bits[68] == 0_u128, 'bits[68] == 0_u128');
    assert(*bits[69] == 1_u128, 'bits[69] == 1_u128');
    assert(*bits[70] == 1_u128, 'bits[70] == 1_u128');
    assert(*bits[71] == 0_u128, 'bits[71] == 0_u128');
    assert(*bits[72] == 0_u128, 'bits[72] == 0_u128');
    assert(*bits[73] == 1_u128, 'bits[73] == 1_u128');
    assert(*bits[74] == 0_u128, 'bits[74] == 0_u128');
    assert(*bits[75] == 0_u128, 'bits[75] == 0_u128');
    assert(*bits[76] == 0_u128, 'bits[76] == 0_u128');
    assert(*bits[77] == 0_u128, 'bits[77] == 0_u128');
    assert(*bits[78] == 0_u128, 'bits[78] == 0_u128');
    assert(*bits[79] == 0_u128, 'bits[79] == 0_u128');
    assert(*bits[80] == 0_u128, 'bits[80] == 0_u128');
    assert(*bits[81] == 0_u128, 'bits[81] == 0_u128');
    assert(*bits[82] == 0_u128, 'bits[82] == 0_u128');
    assert(*bits[83] == 0_u128, 'bits[83] == 0_u128');
    assert(*bits[84] == 0_u128, 'bits[84] == 0_u128');
    assert(*bits[85] == 1_u128, 'bits[85] == 1_u128');
    assert(*bits[86] == 1_u128, 'bits[86] == 1_u128');
    assert(*bits[87] == 0_u128, 'bits[87] == 0_u128');
    assert(*bits[88] == 1_u128, 'bits[88] == 1_u128');
    assert(*bits[89] == 0_u128, 'bits[89] == 0_u128');
    assert(*bits[90] == 0_u128, 'bits[90] == 0_u128');
    assert(*bits[91] == 1_u128, 'bits[91] == 1_u128');
    assert(*bits[92] == 0_u128, 'bits[92] == 0_u128');
    assert(*bits[93] == 0_u128, 'bits[93] == 0_u128');
    assert(*bits[94] == 1_u128, 'bits[94] == 1_u128');
    assert(*bits[95] == 1_u128, 'bits[95] == 1_u128');
    assert(*bits[96] == 0_u128, 'bits[96] == 0_u128');
    assert(*bits[97] == 0_u128, 'bits[97] == 0_u128');
    assert(*bits[98] == 0_u128, 'bits[98] == 0_u128');
    assert(*bits[99] == 0_u128, 'bits[99] == 0_u128');
    assert(*bits[100] == 1_u128, 'bits[100] == 1_u128');
    assert(*bits[101] == 0_u128, 'bits[101] == 0_u128');
    assert(*bits[102] == 0_u128, 'bits[102] == 0_u128');
    assert(*bits[103] == 1_u128, 'bits[103] == 1_u128');
    assert(*bits[104] == 1_u128, 'bits[104] == 1_u128');
    assert(*bits[105] == 1_u128, 'bits[105] == 1_u128');
    assert(*bits[106] == 1_u128, 'bits[106] == 1_u128');
    assert(*bits[107] == 0_u128, 'bits[107] == 0_u128');
    assert(*bits[108] == 0_u128, 'bits[108] == 0_u128');
    assert(*bits[109] == 0_u128, 'bits[109] == 0_u128');
    assert(*bits[110] == 0_u128, 'bits[110] == 0_u128');
    assert(*bits[111] == 0_u128, 'bits[111] == 0_u128');
    assert(*bits[112] == 0_u128, 'bits[112] == 0_u128');
    assert(*bits[113] == 0_u128, 'bits[113] == 0_u128');
    assert(*bits[114] == 0_u128, 'bits[114] == 0_u128');
    assert(*bits[115] == 1_u128, 'bits[115] == 1_u128');
    assert(*bits[116] == 0_u128, 'bits[116] == 0_u128');
    assert(*bits[117] == 0_u128, 'bits[117] == 0_u128');
    assert(*bits[118] == 0_u128, 'bits[118] == 0_u128');
    assert(*bits[119] == 0_u128, 'bits[119] == 0_u128');
    assert(*bits[120] == 0_u128, 'bits[120] == 0_u128');
    assert(*bits[121] == 1_u128, 'bits[121] == 1_u128');
    assert(*bits[122] == 0_u128, 'bits[122] == 0_u128');
    assert(*bits[123] == 0_u128, 'bits[123] == 0_u128');
    assert(*bits[124] == 0_u128, 'bits[124] == 0_u128');
    assert(*bits[125] == 0_u128, 'bits[125] == 0_u128');
    assert(*bits[126] == 0_u128, 'bits[126] == 0_u128');
    assert(*bits[127] == 0_u128, 'bits[127] == 0_u128');
}

#[test]
#[available_gas(20000000000)]
fn test_zero_u128_to_bits() {
    let mut bits: Array<u128> = ArrayTrait::<u128>::new();
    let mut value: u128 = 0_u128;
    extended_lib::shift_u128_to_bits(ref value, ref bits);
    let bits = extended_lib::reverse_array(@bits);
    assert(bits.len() == 128, 'bits length should be 128');
    assert(*bits[0] == 0_u128, 'bits[0] == 0_u128');
    assert(*bits[1] == 0_u128, 'bits[1] == 0_u128');
    assert(*bits[2] == 0_u128, 'bits[2] == 0_u128');
    assert(*bits[3] == 0_u128, 'bits[3] == 0_u128');
    assert(*bits[4] == 0_u128, 'bits[4] == 0_u128');
    assert(*bits[5] == 0_u128, 'bits[5] == 0_u128');
    assert(*bits[6] == 0_u128, 'bits[6] == 0_u128');
    assert(*bits[7] == 0_u128, 'bits[7] == 0_u128');
    assert(*bits[8] == 0_u128, 'bits[8] == 0_u128');
    assert(*bits[9] == 0_u128, 'bits[9] == 0_u128');
    assert(*bits[10] == 0_u128, 'bits[10] == 0_u128');
    assert(*bits[11] == 0_u128, 'bits[11] == 0_u128');
    assert(*bits[12] == 0_u128, 'bits[12] == 0_u128');
    assert(*bits[13] == 0_u128, 'bits[13] == 0_u128');
    assert(*bits[14] == 0_u128, 'bits[14] == 0_u128');
    assert(*bits[15] == 0_u128, 'bits[15] == 0_u128');
    assert(*bits[16] == 0_u128, 'bits[16] == 0_u128');
    assert(*bits[17] == 0_u128, 'bits[17] == 0_u128');
    assert(*bits[18] == 0_u128, 'bits[18] == 0_u128');
    assert(*bits[19] == 0_u128, 'bits[19] == 0_u128');
    assert(*bits[20] == 0_u128, 'bits[20] == 0_u128');
    assert(*bits[21] == 0_u128, 'bits[21] == 0_u128');
    assert(*bits[22] == 0_u128, 'bits[22] == 0_u128');
    assert(*bits[23] == 0_u128, 'bits[23] == 0_u128');
    assert(*bits[24] == 0_u128, 'bits[24] == 0_u128');
    assert(*bits[25] == 0_u128, 'bits[25] == 0_u128');
    assert(*bits[26] == 0_u128, 'bits[26] == 0_u128');
    assert(*bits[27] == 0_u128, 'bits[27] == 0_u128');
    assert(*bits[28] == 0_u128, 'bits[28] == 0_u128');
    assert(*bits[29] == 0_u128, 'bits[29] == 0_u128');
    assert(*bits[30] == 0_u128, 'bits[30] == 0_u128');
    assert(*bits[31] == 0_u128, 'bits[31] == 0_u128');
    assert(*bits[32] == 0_u128, 'bits[32] == 0_u128');
    assert(*bits[33] == 0_u128, 'bits[33] == 0_u128');
    assert(*bits[34] == 0_u128, 'bits[34] == 0_u128');
    assert(*bits[35] == 0_u128, 'bits[35] == 0_u128');
    assert(*bits[36] == 0_u128, 'bits[36] == 0_u128');
    assert(*bits[37] == 0_u128, 'bits[37] == 0_u128');
    assert(*bits[38] == 0_u128, 'bits[38] == 0_u128');
    assert(*bits[39] == 0_u128, 'bits[39] == 0_u128');
    assert(*bits[40] == 0_u128, 'bits[40] == 0_u128');
    assert(*bits[41] == 0_u128, 'bits[41] == 0_u128');
    assert(*bits[42] == 0_u128, 'bits[42] == 0_u128');
    assert(*bits[43] == 0_u128, 'bits[43] == 0_u128');
    assert(*bits[44] == 0_u128, 'bits[44] == 0_u128');
    assert(*bits[45] == 0_u128, 'bits[45] == 0_u128');
    assert(*bits[46] == 0_u128, 'bits[46] == 0_u128');
    assert(*bits[47] == 0_u128, 'bits[47] == 0_u128');
    assert(*bits[48] == 0_u128, 'bits[48] == 0_u128');
    assert(*bits[49] == 0_u128, 'bits[49] == 0_u128');
    assert(*bits[50] == 0_u128, 'bits[50] == 0_u128');
    assert(*bits[51] == 0_u128, 'bits[51] == 0_u128');
    assert(*bits[52] == 0_u128, 'bits[52] == 0_u128');
    assert(*bits[53] == 0_u128, 'bits[53] == 0_u128');
    assert(*bits[54] == 0_u128, 'bits[54] == 0_u128');
    assert(*bits[55] == 0_u128, 'bits[55] == 0_u128');
    assert(*bits[56] == 0_u128, 'bits[56] == 0_u128');
    assert(*bits[57] == 0_u128, 'bits[57] == 0_u128');
    assert(*bits[58] == 0_u128, 'bits[58] == 0_u128');
    assert(*bits[59] == 0_u128, 'bits[59] == 0_u128');
    assert(*bits[60] == 0_u128, 'bits[60] == 0_u128');
    assert(*bits[61] == 0_u128, 'bits[61] == 0_u128');
    assert(*bits[62] == 0_u128, 'bits[62] == 0_u128');
    assert(*bits[63] == 0_u128, 'bits[63] == 0_u128');
    assert(*bits[64] == 0_u128, 'bits[64] == 0_u128');
    assert(*bits[65] == 0_u128, 'bits[65] == 0_u128');
    assert(*bits[66] == 0_u128, 'bits[66] == 0_u128');
    assert(*bits[67] == 0_u128, 'bits[67] == 0_u128');
    assert(*bits[68] == 0_u128, 'bits[68] == 0_u128');
    assert(*bits[69] == 0_u128, 'bits[69] == 0_u128');
    assert(*bits[70] == 0_u128, 'bits[70] == 0_u128');
    assert(*bits[71] == 0_u128, 'bits[71] == 0_u128');
    assert(*bits[72] == 0_u128, 'bits[72] == 0_u128');
    assert(*bits[73] == 0_u128, 'bits[73] == 0_u128');
    assert(*bits[74] == 0_u128, 'bits[74] == 0_u128');
    assert(*bits[75] == 0_u128, 'bits[75] == 0_u128');
    assert(*bits[76] == 0_u128, 'bits[76] == 0_u128');
    assert(*bits[77] == 0_u128, 'bits[77] == 0_u128');
    assert(*bits[78] == 0_u128, 'bits[78] == 0_u128');
    assert(*bits[79] == 0_u128, 'bits[79] == 0_u128');
    assert(*bits[80] == 0_u128, 'bits[80] == 0_u128');
    assert(*bits[81] == 0_u128, 'bits[81] == 0_u128');
    assert(*bits[82] == 0_u128, 'bits[82] == 0_u128');
    assert(*bits[83] == 0_u128, 'bits[83] == 0_u128');
    assert(*bits[84] == 0_u128, 'bits[84] == 0_u128');
    assert(*bits[85] == 0_u128, 'bits[85] == 0_u128');
    assert(*bits[86] == 0_u128, 'bits[86] == 0_u128');
    assert(*bits[87] == 0_u128, 'bits[87] == 0_u128');
    assert(*bits[88] == 0_u128, 'bits[88] == 0_u128');
    assert(*bits[89] == 0_u128, 'bits[89] == 0_u128');
    assert(*bits[90] == 0_u128, 'bits[90] == 0_u128');
    assert(*bits[91] == 0_u128, 'bits[91] == 0_u128');
    assert(*bits[92] == 0_u128, 'bits[92] == 0_u128');
    assert(*bits[93] == 0_u128, 'bits[93] == 0_u128');
    assert(*bits[94] == 0_u128, 'bits[94] == 0_u128');
    assert(*bits[95] == 0_u128, 'bits[95] == 0_u128');
    assert(*bits[96] == 0_u128, 'bits[96] == 0_u128');
    assert(*bits[97] == 0_u128, 'bits[97] == 0_u128');
    assert(*bits[98] == 0_u128, 'bits[98] == 0_u128');
    assert(*bits[99] == 0_u128, 'bits[99] == 0_u128');
    assert(*bits[100] == 0_u128, 'bits[100] == 0_u128');
    assert(*bits[101] == 0_u128, 'bits[101] == 0_u128');
    assert(*bits[102] == 0_u128, 'bits[102] == 0_u128');
    assert(*bits[103] == 0_u128, 'bits[103] == 0_u128');
    assert(*bits[104] == 0_u128, 'bits[104] == 0_u128');
    assert(*bits[105] == 0_u128, 'bits[105] == 0_u128');
    assert(*bits[106] == 0_u128, 'bits[106] == 0_u128');
    assert(*bits[107] == 0_u128, 'bits[107] == 0_u128');
    assert(*bits[108] == 0_u128, 'bits[108] == 0_u128');
    assert(*bits[109] == 0_u128, 'bits[109] == 0_u128');
    assert(*bits[110] == 0_u128, 'bits[110] == 0_u128');
    assert(*bits[111] == 0_u128, 'bits[111] == 0_u128');
    assert(*bits[112] == 0_u128, 'bits[112] == 0_u128');
    assert(*bits[113] == 0_u128, 'bits[113] == 0_u128');
    assert(*bits[114] == 0_u128, 'bits[114] == 0_u128');
    assert(*bits[115] == 0_u128, 'bits[115] == 0_u128');
    assert(*bits[116] == 0_u128, 'bits[116] == 0_u128');
    assert(*bits[117] == 0_u128, 'bits[117] == 0_u128');
    assert(*bits[118] == 0_u128, 'bits[118] == 0_u128');
    assert(*bits[119] == 0_u128, 'bits[119] == 0_u128');
    assert(*bits[120] == 0_u128, 'bits[120] == 0_u128');
    assert(*bits[121] == 0_u128, 'bits[121] == 0_u128');
    assert(*bits[122] == 0_u128, 'bits[122] == 0_u128');
    assert(*bits[123] == 0_u128, 'bits[123] == 0_u128');
    assert(*bits[124] == 0_u128, 'bits[124] == 0_u128');
    assert(*bits[125] == 0_u128, 'bits[125] == 0_u128');
    assert(*bits[126] == 0_u128, 'bits[126] == 0_u128');
    assert(*bits[127] == 0_u128, 'bits[127] == 0_u128');
}

#[test]
#[available_gas(20000000000)]
fn test_one_u128_to_bits() {
    let mut bits: Array<u128> = ArrayTrait::<u128>::new();
    let mut value: u128 = 1_u128;
    extended_lib::shift_u128_to_bits(ref value, ref bits);
    assert(*bits[0] == 0_u128, 'bits[0] == 0_u128');
    assert(*bits[1] == 0_u128, 'bits[1] == 0_u128');
    assert(*bits[2] == 0_u128, 'bits[2] == 0_u128');
    assert(*bits[3] == 0_u128, 'bits[3] == 0_u128');
    assert(*bits[4] == 0_u128, 'bits[4] == 0_u128');
    assert(*bits[5] == 0_u128, 'bits[5] == 0_u128');
    assert(*bits[6] == 0_u128, 'bits[6] == 0_u128');
    assert(*bits[7] == 0_u128, 'bits[7] == 0_u128');
    assert(*bits[8] == 0_u128, 'bits[8] == 0_u128');
    assert(*bits[9] == 0_u128, 'bits[9] == 0_u128');
    assert(*bits[10] == 0_u128, 'bits[10] == 0_u128');
    assert(*bits[11] == 0_u128, 'bits[11] == 0_u128');
    assert(*bits[12] == 0_u128, 'bits[12] == 0_u128');
    assert(*bits[13] == 0_u128, 'bits[13] == 0_u128');
    assert(*bits[14] == 0_u128, 'bits[14] == 0_u128');
    assert(*bits[15] == 0_u128, 'bits[15] == 0_u128');
    assert(*bits[16] == 0_u128, 'bits[16] == 0_u128');
    assert(*bits[17] == 0_u128, 'bits[17] == 0_u128');
    assert(*bits[18] == 0_u128, 'bits[18] == 0_u128');
    assert(*bits[19] == 0_u128, 'bits[19] == 0_u128');
    assert(*bits[20] == 0_u128, 'bits[20] == 0_u128');
    assert(*bits[21] == 0_u128, 'bits[21] == 0_u128');
    assert(*bits[22] == 0_u128, 'bits[22] == 0_u128');
    assert(*bits[23] == 0_u128, 'bits[23] == 0_u128');
    assert(*bits[24] == 0_u128, 'bits[24] == 0_u128');
    assert(*bits[25] == 0_u128, 'bits[25] == 0_u128');
    assert(*bits[26] == 0_u128, 'bits[26] == 0_u128');
    assert(*bits[27] == 0_u128, 'bits[27] == 0_u128');
    assert(*bits[28] == 0_u128, 'bits[28] == 0_u128');
    assert(*bits[29] == 0_u128, 'bits[29] == 0_u128');
    assert(*bits[30] == 0_u128, 'bits[30] == 0_u128');
    assert(*bits[31] == 0_u128, 'bits[31] == 0_u128');
    assert(*bits[32] == 0_u128, 'bits[32] == 0_u128');
    assert(*bits[33] == 0_u128, 'bits[33] == 0_u128');
    assert(*bits[34] == 0_u128, 'bits[34] == 0_u128');
    assert(*bits[35] == 0_u128, 'bits[35] == 0_u128');
    assert(*bits[36] == 0_u128, 'bits[36] == 0_u128');
    assert(*bits[37] == 0_u128, 'bits[37] == 0_u128');
    assert(*bits[38] == 0_u128, 'bits[38] == 0_u128');
    assert(*bits[39] == 0_u128, 'bits[39] == 0_u128');
    assert(*bits[40] == 0_u128, 'bits[40] == 0_u128');
    assert(*bits[41] == 0_u128, 'bits[41] == 0_u128');
    assert(*bits[42] == 0_u128, 'bits[42] == 0_u128');
    assert(*bits[43] == 0_u128, 'bits[43] == 0_u128');
    assert(*bits[44] == 0_u128, 'bits[44] == 0_u128');
    assert(*bits[45] == 0_u128, 'bits[45] == 0_u128');
    assert(*bits[46] == 0_u128, 'bits[46] == 0_u128');
    assert(*bits[47] == 0_u128, 'bits[47] == 0_u128');
    assert(*bits[48] == 0_u128, 'bits[48] == 0_u128');
    assert(*bits[49] == 0_u128, 'bits[49] == 0_u128');
    assert(*bits[50] == 0_u128, 'bits[50] == 0_u128');
    assert(*bits[51] == 0_u128, 'bits[51] == 0_u128');
    assert(*bits[52] == 0_u128, 'bits[52] == 0_u128');
    assert(*bits[53] == 0_u128, 'bits[53] == 0_u128');
    assert(*bits[54] == 0_u128, 'bits[54] == 0_u128');
    assert(*bits[55] == 0_u128, 'bits[55] == 0_u128');
    assert(*bits[56] == 0_u128, 'bits[56] == 0_u128');
    assert(*bits[57] == 0_u128, 'bits[57] == 0_u128');
    assert(*bits[58] == 0_u128, 'bits[58] == 0_u128');
    assert(*bits[59] == 0_u128, 'bits[59] == 0_u128');
    assert(*bits[60] == 0_u128, 'bits[60] == 0_u128');
    assert(*bits[61] == 0_u128, 'bits[61] == 0_u128');
    assert(*bits[62] == 0_u128, 'bits[62] == 0_u128');
    assert(*bits[63] == 0_u128, 'bits[63] == 0_u128');
    assert(*bits[64] == 0_u128, 'bits[64] == 0_u128');
    assert(*bits[65] == 0_u128, 'bits[65] == 0_u128');
    assert(*bits[66] == 0_u128, 'bits[66] == 0_u128');
    assert(*bits[67] == 0_u128, 'bits[67] == 0_u128');
    assert(*bits[68] == 0_u128, 'bits[68] == 0_u128');
    assert(*bits[69] == 0_u128, 'bits[69] == 0_u128');
    assert(*bits[70] == 0_u128, 'bits[70] == 0_u128');
    assert(*bits[71] == 0_u128, 'bits[71] == 0_u128');
    assert(*bits[72] == 0_u128, 'bits[72] == 0_u128');
    assert(*bits[73] == 0_u128, 'bits[73] == 0_u128');
    assert(*bits[74] == 0_u128, 'bits[74] == 0_u128');
    assert(*bits[75] == 0_u128, 'bits[75] == 0_u128');
    assert(*bits[76] == 0_u128, 'bits[76] == 0_u128');
    assert(*bits[77] == 0_u128, 'bits[77] == 0_u128');
    assert(*bits[78] == 0_u128, 'bits[78] == 0_u128');
    assert(*bits[79] == 0_u128, 'bits[79] == 0_u128');
    assert(*bits[80] == 0_u128, 'bits[80] == 0_u128');
    assert(*bits[81] == 0_u128, 'bits[81] == 0_u128');
    assert(*bits[82] == 0_u128, 'bits[82] == 0_u128');
    assert(*bits[83] == 0_u128, 'bits[83] == 0_u128');
    assert(*bits[84] == 0_u128, 'bits[84] == 0_u128');
    assert(*bits[85] == 0_u128, 'bits[85] == 0_u128');
    assert(*bits[86] == 0_u128, 'bits[86] == 0_u128');
    assert(*bits[87] == 0_u128, 'bits[87] == 0_u128');
    assert(*bits[88] == 0_u128, 'bits[88] == 0_u128');
    assert(*bits[89] == 0_u128, 'bits[89] == 0_u128');
    assert(*bits[90] == 0_u128, 'bits[90] == 0_u128');
    assert(*bits[91] == 0_u128, 'bits[91] == 0_u128');
    assert(*bits[92] == 0_u128, 'bits[92] == 0_u128');
    assert(*bits[93] == 0_u128, 'bits[93] == 0_u128');
    assert(*bits[94] == 0_u128, 'bits[94] == 0_u128');
    assert(*bits[95] == 0_u128, 'bits[95] == 0_u128');
    assert(*bits[96] == 0_u128, 'bits[96] == 0_u128');
    assert(*bits[97] == 0_u128, 'bits[97] == 0_u128');
    assert(*bits[98] == 0_u128, 'bits[98] == 0_u128');
    assert(*bits[99] == 0_u128, 'bits[99] == 0_u128');
    assert(*bits[100] == 0_u128, 'bits[100] == 0_u128');
    assert(*bits[101] == 0_u128, 'bits[101] == 0_u128');
    assert(*bits[102] == 0_u128, 'bits[102] == 0_u128');
    assert(*bits[103] == 0_u128, 'bits[103] == 0_u128');
    assert(*bits[104] == 0_u128, 'bits[104] == 0_u128');
    assert(*bits[105] == 0_u128, 'bits[105] == 0_u128');
    assert(*bits[106] == 0_u128, 'bits[106] == 0_u128');
    assert(*bits[107] == 0_u128, 'bits[107] == 0_u128');
    assert(*bits[108] == 0_u128, 'bits[108] == 0_u128');
    assert(*bits[109] == 0_u128, 'bits[109] == 0_u128');
    assert(*bits[110] == 0_u128, 'bits[110] == 0_u128');
    assert(*bits[111] == 0_u128, 'bits[111] == 0_u128');
    assert(*bits[112] == 0_u128, 'bits[112] == 0_u128');
    assert(*bits[113] == 0_u128, 'bits[113] == 0_u128');
    assert(*bits[114] == 0_u128, 'bits[114] == 0_u128');
    assert(*bits[115] == 0_u128, 'bits[115] == 0_u128');
    assert(*bits[116] == 0_u128, 'bits[116] == 0_u128');
    assert(*bits[117] == 0_u128, 'bits[117] == 0_u128');
    assert(*bits[118] == 0_u128, 'bits[118] == 0_u128');
    assert(*bits[119] == 0_u128, 'bits[119] == 0_u128');
    assert(*bits[120] == 0_u128, 'bits[120] == 0_u128');
    assert(*bits[121] == 0_u128, 'bits[121] == 0_u128');
    assert(*bits[122] == 0_u128, 'bits[122] == 0_u128');
    assert(*bits[123] == 0_u128, 'bits[123] == 0_u128');
    assert(*bits[124] == 0_u128, 'bits[124] == 0_u128');
    assert(*bits[125] == 0_u128, 'bits[125] == 0_u128');
    assert(*bits[126] == 0_u128, 'bits[126] == 0_u128');
    assert(*bits[127] == 1_u128, 'bits[127] == 1_u128');
}

#[test]
#[available_gas(20000000000)]
fn test_max_u128_to_bits() {
    let mut bits = ArrayTrait::<u128>::new();
    // max value in u128
    let mut value = 0xffffffffffffffffffffffffffffffff_u128;
    extended_lib::shift_u128_to_bits(ref value, ref bits);
    let bits = extended_lib::reverse_array(@bits);
    assert(*bits[0] == 1_u128, 'bits[0] == 1_u128');
    assert(*bits[1] == 1_u128, 'bits[1] == 1_u128');
    assert(*bits[2] == 1_u128, 'bits[2] == 1_u128');
    assert(*bits[3] == 1_u128, 'bits[3] == 1_u128');
    assert(*bits[4] == 1_u128, 'bits[4] == 1_u128');
    assert(*bits[5] == 1_u128, 'bits[5] == 1_u128');
    assert(*bits[6] == 1_u128, 'bits[6] == 1_u128');
    assert(*bits[7] == 1_u128, 'bits[7] == 1_u128');
    assert(*bits[8] == 1_u128, 'bits[8] == 1_u128');
    assert(*bits[9] == 1_u128, 'bits[9] == 1_u128');
    assert(*bits[10] == 1_u128, 'bits[10] == 1_u128');
    assert(*bits[11] == 1_u128, 'bits[11] == 1_u128');
    assert(*bits[12] == 1_u128, 'bits[12] == 1_u128');
    assert(*bits[13] == 1_u128, 'bits[13] == 1_u128');
    assert(*bits[14] == 1_u128, 'bits[14] == 1_u128');
    assert(*bits[15] == 1_u128, 'bits[15] == 1_u128');
    assert(*bits[16] == 1_u128, 'bits[16] == 1_u128');
    assert(*bits[17] == 1_u128, 'bits[17] == 1_u128');
    assert(*bits[18] == 1_u128, 'bits[18] == 1_u128');
    assert(*bits[19] == 1_u128, 'bits[19] == 1_u128');
    assert(*bits[20] == 1_u128, 'bits[20] == 1_u128');
    assert(*bits[21] == 1_u128, 'bits[21] == 1_u128');
    assert(*bits[22] == 1_u128, 'bits[22] == 1_u128');
    assert(*bits[23] == 1_u128, 'bits[23] == 1_u128');
    assert(*bits[24] == 1_u128, 'bits[24] == 1_u128');
    assert(*bits[25] == 1_u128, 'bits[25] == 1_u128');
    assert(*bits[26] == 1_u128, 'bits[26] == 1_u128');
    assert(*bits[27] == 1_u128, 'bits[27] == 1_u128');
    assert(*bits[28] == 1_u128, 'bits[28] == 1_u128');
    assert(*bits[29] == 1_u128, 'bits[29] == 1_u128');
    assert(*bits[30] == 1_u128, 'bits[30] == 1_u128');
    assert(*bits[31] == 1_u128, 'bits[31] == 1_u128');
    assert(*bits[32] == 1_u128, 'bits[32] == 1_u128');
    assert(*bits[33] == 1_u128, 'bits[33] == 1_u128');
    assert(*bits[34] == 1_u128, 'bits[34] == 1_u128');
    assert(*bits[35] == 1_u128, 'bits[35] == 1_u128');
    assert(*bits[36] == 1_u128, 'bits[36] == 1_u128');
    assert(*bits[37] == 1_u128, 'bits[37] == 1_u128');
    assert(*bits[38] == 1_u128, 'bits[38] == 1_u128');
    assert(*bits[39] == 1_u128, 'bits[39] == 1_u128');
    assert(*bits[40] == 1_u128, 'bits[40] == 1_u128');
    assert(*bits[41] == 1_u128, 'bits[41] == 1_u128');
    assert(*bits[42] == 1_u128, 'bits[42] == 1_u128');
    assert(*bits[43] == 1_u128, 'bits[43] == 1_u128');
    assert(*bits[44] == 1_u128, 'bits[44] == 1_u128');
    assert(*bits[45] == 1_u128, 'bits[45] == 1_u128');
    assert(*bits[46] == 1_u128, 'bits[46] == 1_u128');
    assert(*bits[47] == 1_u128, 'bits[47] == 1_u128');
    assert(*bits[48] == 1_u128, 'bits[48] == 1_u128');
    assert(*bits[49] == 1_u128, 'bits[49] == 1_u128');
    assert(*bits[50] == 1_u128, 'bits[50] == 1_u128');
    assert(*bits[51] == 1_u128, 'bits[51] == 1_u128');
    assert(*bits[52] == 1_u128, 'bits[52] == 1_u128');
    assert(*bits[53] == 1_u128, 'bits[53] == 1_u128');
    assert(*bits[54] == 1_u128, 'bits[54] == 1_u128');
    assert(*bits[55] == 1_u128, 'bits[55] == 1_u128');
    assert(*bits[56] == 1_u128, 'bits[56] == 1_u128');
    assert(*bits[57] == 1_u128, 'bits[57] == 1_u128');
    assert(*bits[58] == 1_u128, 'bits[58] == 1_u128');
    assert(*bits[59] == 1_u128, 'bits[59] == 1_u128');
    assert(*bits[60] == 1_u128, 'bits[60] == 1_u128');
    assert(*bits[61] == 1_u128, 'bits[61] == 1_u128');
    assert(*bits[62] == 1_u128, 'bits[62] == 1_u128');
    assert(*bits[63] == 1_u128, 'bits[63] == 1_u128');
    assert(*bits[64] == 1_u128, 'bits[64] == 1_u128');
    assert(*bits[65] == 1_u128, 'bits[65] == 1_u128');
    assert(*bits[66] == 1_u128, 'bits[66] == 1_u128');
    assert(*bits[67] == 1_u128, 'bits[67] == 1_u128');
    assert(*bits[68] == 1_u128, 'bits[68] == 1_u128');
    assert(*bits[69] == 1_u128, 'bits[69] == 1_u128');
    assert(*bits[70] == 1_u128, 'bits[70] == 1_u128');
    assert(*bits[71] == 1_u128, 'bits[71] == 1_u128');
    assert(*bits[72] == 1_u128, 'bits[72] == 1_u128');
    assert(*bits[73] == 1_u128, 'bits[73] == 1_u128');
    assert(*bits[74] == 1_u128, 'bits[74] == 1_u128');
    assert(*bits[75] == 1_u128, 'bits[75] == 1_u128');
    assert(*bits[76] == 1_u128, 'bits[76] == 1_u128');
    assert(*bits[77] == 1_u128, 'bits[77] == 1_u128');
    assert(*bits[78] == 1_u128, 'bits[78] == 1_u128');
    assert(*bits[79] == 1_u128, 'bits[79] == 1_u128');
    assert(*bits[80] == 1_u128, 'bits[80] == 1_u128');
    assert(*bits[81] == 1_u128, 'bits[81] == 1_u128');
    assert(*bits[82] == 1_u128, 'bits[82] == 1_u128');
    assert(*bits[83] == 1_u128, 'bits[83] == 1_u128');
    assert(*bits[84] == 1_u128, 'bits[84] == 1_u128');
    assert(*bits[85] == 1_u128, 'bits[85] == 1_u128');
    assert(*bits[86] == 1_u128, 'bits[86] == 1_u128');
    assert(*bits[87] == 1_u128, 'bits[87] == 1_u128');
    assert(*bits[88] == 1_u128, 'bits[88] == 1_u128');
    assert(*bits[89] == 1_u128, 'bits[89] == 1_u128');
    assert(*bits[90] == 1_u128, 'bits[90] == 1_u128');
    assert(*bits[91] == 1_u128, 'bits[91] == 1_u128');
    assert(*bits[92] == 1_u128, 'bits[92] == 1_u128');
    assert(*bits[93] == 1_u128, 'bits[93] == 1_u128');
    assert(*bits[94] == 1_u128, 'bits[94] == 1_u128');
    assert(*bits[95] == 1_u128, 'bits[95] == 1_u128');
    assert(*bits[96] == 1_u128, 'bits[96] == 1_u128');
    assert(*bits[97] == 1_u128, 'bits[97] == 1_u128');
    assert(*bits[98] == 1_u128, 'bits[98] == 1_u128');
    assert(*bits[99] == 1_u128, 'bits[99] == 1_u128');
    assert(*bits[100] == 1_u128, 'bits[100] == 1_u128');
    assert(*bits[101] == 1_u128, 'bits[101] == 1_u128');
    assert(*bits[102] == 1_u128, 'bits[102] == 1_u128');
    assert(*bits[103] == 1_u128, 'bits[103] == 1_u128');
    assert(*bits[104] == 1_u128, 'bits[104] == 1_u128');
    assert(*bits[105] == 1_u128, 'bits[105] == 1_u128');
    assert(*bits[106] == 1_u128, 'bits[106] == 1_u128');
    assert(*bits[107] == 1_u128, 'bits[107] == 1_u128');
    assert(*bits[108] == 1_u128, 'bits[108] == 1_u128');
    assert(*bits[109] == 1_u128, 'bits[109] == 1_u128');
    assert(*bits[110] == 1_u128, 'bits[110] == 1_u128');
    assert(*bits[111] == 1_u128, 'bits[111] == 1_u128');
    assert(*bits[112] == 1_u128, 'bits[112] == 1_u128');
    assert(*bits[113] == 1_u128, 'bits[113] == 1_u128');
    assert(*bits[114] == 1_u128, 'bits[114] == 1_u128');
    assert(*bits[115] == 1_u128, 'bits[115] == 1_u128');
    assert(*bits[116] == 1_u128, 'bits[116] == 1_u128');
    assert(*bits[117] == 1_u128, 'bits[117] == 1_u128');
    assert(*bits[118] == 1_u128, 'bits[118] == 1_u128');
    assert(*bits[119] == 1_u128, 'bits[119] == 1_u128');
    assert(*bits[120] == 1_u128, 'bits[120] == 1_u128');
    assert(*bits[121] == 1_u128, 'bits[121] == 1_u128');
    assert(*bits[122] == 1_u128, 'bits[122] == 1_u128');
    assert(*bits[123] == 1_u128, 'bits[123] == 1_u128');
    assert(*bits[124] == 1_u128, 'bits[124] == 1_u128');
    assert(*bits[125] == 1_u128, 'bits[125] == 1_u128');
    assert(*bits[126] == 1_u128, 'bits[126] == 1_u128');
    assert(*bits[127] == 1_u128, 'bits[127] == 1_u128');
}
