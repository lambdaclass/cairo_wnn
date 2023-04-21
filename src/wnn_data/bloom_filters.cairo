use array::ArrayTrait;

#[derive(Drop)]
struct Discriminators {
    amount_layers: u32,
    amount_bits: u32,
    bloom_filters: Array<BloomFilter>,
}

trait DiscriminatorsTrait {
    fn predict(self: @Discriminators, input: @Array<u64>) -> u32;
}

impl DiscriminatorsTraitImpl of DiscriminatorsTrait {
    // Predicting consist of iterating each discriminator and checking the membership of the input and then summing all the values
    fn predict(self: @Discriminators, input: @Array<u64>) -> u32 {
        let mut counter: u32 = 0;
        let mut sum: u32 = 0;
        loop {
            if counter == self.bloom_filters.len() {
                break sum;
            }
            let bloom_filter = self.bloom_filters[counter];
            let membership = bloom_filter.check_membership(*input[counter]);
            if membership {
                sum += 1;
            }
            counter += 1;
        };
        sum
    }
}

#[derive(Drop)]
struct BloomFilter {
    filters: Array<u64>,
}

trait BloomFilterTrait {
    fn check_membership(self: @BloomFilter, input: u64) -> bool;
}

impl BloomFilterTraitImpl of BloomFilterTrait {
    fn check_membership(self: @BloomFilter, input: u64) -> bool {
        let mut counter: u32 = 0;
         loop{
            if counter == self.filters.len() {
                break false;
            }
            if input == *self.filters[counter] {
                break true;
            }
            counter += 1;
        }
    }
}

fn load_bloom_filters() -> Discriminators {
    let mut bloom_filters: Array<BloomFilter> = ArrayTrait::new();
    let mut input0 = ArrayTrait::new();
    input0.append(0_u64);
    input0.append(0_u64);
    input0.append(0_u64);
    input0.append(1_u64);
    input0.append(1_u64);
    input0.append(0_u64);
    input0.append(0_u64);
    input0.append(1_u64);
    input0.append(0_u64);
    input0.append(1_u64);
    input0.append(0_u64);
    input0.append(0_u64);
    input0.append(1_u64);
    input0.append(1_u64);
    input0.append(1_u64);
    input0.append(0_u64);
    input0.append(1_u64);
    input0.append(1_u64);
    input0.append(0_u64);
    input0.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input0,
        }
    );

    let mut input1 = ArrayTrait::new();
    input1.append(0_u64);
    input1.append(0_u64);
    input1.append(0_u64);
    input1.append(0_u64);
    input1.append(1_u64);
    input1.append(0_u64);
    input1.append(1_u64);
    input1.append(1_u64);
    input1.append(0_u64);
    input1.append(1_u64);
    input1.append(0_u64);
    input1.append(0_u64);
    input1.append(0_u64);
    input1.append(1_u64);
    input1.append(1_u64);
    input1.append(1_u64);
    input1.append(1_u64);
    input1.append(1_u64);
    input1.append(1_u64);
    input1.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input1,
        }
    );

    let mut input2 = ArrayTrait::new();
    input2.append(0_u64);
    input2.append(0_u64);
    input2.append(0_u64);
    input2.append(1_u64);
    input2.append(0_u64);
    input2.append(1_u64);
    input2.append(0_u64);
    input2.append(1_u64);
    input2.append(1_u64);
    input2.append(1_u64);
    input2.append(1_u64);
    input2.append(0_u64);
    input2.append(0_u64);
    input2.append(1_u64);
    input2.append(0_u64);
    input2.append(1_u64);
    input2.append(0_u64);
    input2.append(1_u64);
    input2.append(1_u64);
    input2.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input2,
        }
    );

    let mut input3 = ArrayTrait::new();
    input3.append(1_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    input3.append(1_u64);
    input3.append(0_u64);
    input3.append(1_u64);
    input3.append(1_u64);
    input3.append(0_u64);
    input3.append(1_u64);
    input3.append(1_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    input3.append(1_u64);
    input3.append(0_u64);
    input3.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input3,
        }
    );

    let mut input4 = ArrayTrait::new();
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(0_u64);
    input4.append(1_u64);
    input4.append(0_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(0_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    input4.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input4,
        }
    );

    let mut input5 = ArrayTrait::new();
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    input5.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input5,
        }
    );

    let mut input6 = ArrayTrait::new();
    input6.append(0_u64);
    input6.append(0_u64);
    input6.append(0_u64);
    input6.append(1_u64);
    input6.append(1_u64);
    input6.append(0_u64);
    input6.append(0_u64);
    input6.append(1_u64);
    input6.append(0_u64);
    input6.append(1_u64);
    input6.append(0_u64);
    input6.append(0_u64);
    input6.append(0_u64);
    input6.append(0_u64);
    input6.append(1_u64);
    input6.append(0_u64);
    input6.append(0_u64);
    input6.append(1_u64);
    input6.append(0_u64);
    input6.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input6,
        }
    );

    let mut input7 = ArrayTrait::new();
    input7.append(1_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(1_u64);
    input7.append(0_u64);
    input7.append(1_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(1_u64);
    input7.append(1_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(0_u64);
    input7.append(1_u64);
    input7.append(0_u64);
    input7.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input7,
        }
    );

    let mut input8 = ArrayTrait::new();
    input8.append(0_u64);
    input8.append(0_u64);
    input8.append(1_u64);
    input8.append(1_u64);
    input8.append(1_u64);
    input8.append(0_u64);
    input8.append(0_u64);
    input8.append(1_u64);
    input8.append(0_u64);
    input8.append(1_u64);
    input8.append(0_u64);
    input8.append(0_u64);
    input8.append(0_u64);
    input8.append(0_u64);
    input8.append(0_u64);
    input8.append(0_u64);
    input8.append(1_u64);
    input8.append(1_u64);
    input8.append(1_u64);
    input8.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input8,
        }
    );

    let mut input9 = ArrayTrait::new();
    input9.append(0_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    input9.append(0_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    input9.append(0_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    input9.append(0_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    input9.append(0_u64);
    input9.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input9,
        }
    );

    let mut input10 = ArrayTrait::new();
    input10.append(1_u64);
    input10.append(0_u64);
    input10.append(0_u64);
    input10.append(0_u64);
    input10.append(0_u64);
    input10.append(1_u64);
    input10.append(0_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(0_u64);
    input10.append(0_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    input10.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input10,
        }
    );

    let mut input11 = ArrayTrait::new();
    input11.append(0_u64);
    input11.append(0_u64);
    input11.append(0_u64);
    input11.append(0_u64);
    input11.append(0_u64);
    input11.append(0_u64);
    input11.append(0_u64);
    input11.append(1_u64);
    input11.append(0_u64);
    input11.append(1_u64);
    input11.append(1_u64);
    input11.append(0_u64);
    input11.append(1_u64);
    input11.append(1_u64);
    input11.append(0_u64);
    input11.append(0_u64);
    input11.append(1_u64);
    input11.append(1_u64);
    input11.append(0_u64);
    input11.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input11,
        }
    );

    let mut input12 = ArrayTrait::new();
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(1_u64);
    input12.append(0_u64);
    input12.append(1_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    input12.append(1_u64);
    input12.append(0_u64);
    input12.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input12,
        }
    );

    let mut input13 = ArrayTrait::new();
    input13.append(0_u64);
    input13.append(0_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(0_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(0_u64);
    input13.append(0_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(0_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    input13.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input13,
        }
    );

    let mut input14 = ArrayTrait::new();
    input14.append(0_u64);
    input14.append(0_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(0_u64);
    input14.append(0_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(0_u64);
    input14.append(0_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(0_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    input14.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input14,
        }
    );

    let mut input15 = ArrayTrait::new();
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(1_u64);
    input15.append(0_u64);
    input15.append(0_u64);
    input15.append(0_u64);
    input15.append(0_u64);
    input15.append(0_u64);
    input15.append(0_u64);
    input15.append(0_u64);
    input15.append(1_u64);
    input15.append(0_u64);
    input15.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input15,
        }
    );

    let mut input16 = ArrayTrait::new();
    input16.append(0_u64);
    input16.append(0_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(0_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(0_u64);
    input16.append(0_u64);
    input16.append(1_u64);
    input16.append(0_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    input16.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input16,
        }
    );

    let mut input17 = ArrayTrait::new();
    input17.append(1_u64);
    input17.append(0_u64);
    input17.append(0_u64);
    input17.append(1_u64);
    input17.append(1_u64);
    input17.append(1_u64);
    input17.append(0_u64);
    input17.append(1_u64);
    input17.append(0_u64);
    input17.append(1_u64);
    input17.append(0_u64);
    input17.append(0_u64);
    input17.append(1_u64);
    input17.append(0_u64);
    input17.append(1_u64);
    input17.append(1_u64);
    input17.append(0_u64);
    input17.append(1_u64);
    input17.append(0_u64);
    input17.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input17,
        }
    );

    let mut input18 = ArrayTrait::new();
    input18.append(0_u64);
    input18.append(0_u64);
    input18.append(1_u64);
    input18.append(1_u64);
    input18.append(1_u64);
    input18.append(0_u64);
    input18.append(1_u64);
    input18.append(1_u64);
    input18.append(0_u64);
    input18.append(1_u64);
    input18.append(0_u64);
    input18.append(0_u64);
    input18.append(1_u64);
    input18.append(1_u64);
    input18.append(1_u64);
    input18.append(0_u64);
    input18.append(1_u64);
    input18.append(1_u64);
    input18.append(0_u64);
    input18.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input18,
        }
    );

    let mut input19 = ArrayTrait::new();
    input19.append(1_u64);
    input19.append(0_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(0_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    input19.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input19,
        }
    );
    
    let mut input20 = ArrayTrait::new();
    input20.append(0_u64);
    input20.append(1_u64);
    input20.append(1_u64);
    input20.append(1_u64);
    input20.append(1_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(1_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(0_u64);
    input20.append(1_u64);
    input20.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input20,
        }
    );

    let mut input21 = ArrayTrait::new();
    input21.append(0_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(0_u64);
    input21.append(1_u64);
    input21.append(0_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    input21.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input21,
        }
    );

    let mut input22 = ArrayTrait::new();
    input22.append(1_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(1_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(0_u64);
    input22.append(1_u64);
    input22.append(0_u64);
    input22.append(1_u64);
    input22.append(1_u64);
    input22.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input22,
        }
    );

    let mut input23 = ArrayTrait::new();
    input23.append(1_u64);
    input23.append(0_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(0_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(0_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(0_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    input23.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input23,
        }
    );

    let mut input24 = ArrayTrait::new();
    input24.append(1_u64);
    input24.append(0_u64);
    input24.append(0_u64);
    input24.append(0_u64);
    input24.append(1_u64);
    input24.append(0_u64);
    input24.append(1_u64);
    input24.append(1_u64);
    input24.append(1_u64);
    input24.append(1_u64);
    input24.append(1_u64);
    input24.append(0_u64);
    input24.append(1_u64);
    input24.append(0_u64);
    input24.append(1_u64);
    input24.append(0_u64);
    input24.append(1_u64);
    input24.append(1_u64);
    input24.append(1_u64);
    input24.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input24,
        }
    );

    let mut input25 = ArrayTrait::new();
    input25.append(1_u64);
    input25.append(0_u64);
    input25.append(0_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    input25.append(0_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    input25.append(0_u64);
    input25.append(0_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    input25.append(0_u64);
    input25.append(0_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    input25.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input25,
        }
    );

    let mut input26 = ArrayTrait::new();
    input26.append(1_u64);
    input26.append(1_u64);
    input26.append(0_u64);
    input26.append(1_u64);
    input26.append(1_u64);
    input26.append(1_u64);
    input26.append(0_u64);
    input26.append(1_u64);
    input26.append(0_u64);
    input26.append(1_u64);
    input26.append(1_u64);
    input26.append(0_u64);
    input26.append(1_u64);
    input26.append(1_u64);
    input26.append(0_u64);
    input26.append(1_u64);
    input26.append(1_u64);
    input26.append(1_u64);
    input26.append(0_u64);
    input26.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input26,
        }
    );

    let mut input27 = ArrayTrait::new();
    input27.append(0_u64);
    input27.append(0_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    input27.append(0_u64);
    input27.append(0_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    input27.append(0_u64);
    input27.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input27,
        }
    );

    let mut input28 = ArrayTrait::new();
    input28.append(0_u64);
    input28.append(0_u64);
    input28.append(1_u64);
    input28.append(0_u64);
    input28.append(1_u64);
    input28.append(0_u64);
    input28.append(0_u64);
    input28.append(1_u64);
    input28.append(1_u64);
    input28.append(1_u64);
    input28.append(0_u64);
    input28.append(0_u64);
    input28.append(1_u64);
    input28.append(0_u64);
    input28.append(1_u64);
    input28.append(0_u64);
    input28.append(0_u64);
    input28.append(1_u64);
    input28.append(1_u64);
    input28.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input28,
        }
    );

    let mut input29 = ArrayTrait::new();
    input29.append(1_u64);
    input29.append(1_u64);
    input29.append(0_u64);
    input29.append(0_u64);
    input29.append(1_u64);
    input29.append(0_u64);
    input29.append(1_u64);
    input29.append(1_u64);
    input29.append(1_u64);
    input29.append(0_u64);
    input29.append(0_u64);
    input29.append(1_u64);
    input29.append(0_u64);
    input29.append(0_u64);
    input29.append(1_u64);
    input29.append(0_u64);
    input29.append(0_u64);
    input29.append(1_u64);
    input29.append(1_u64);
    input29.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input29,
        }
    );

    let mut input30 = ArrayTrait::new();
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(1_u64);
    input30.append(0_u64);
    input30.append(1_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(0_u64);
    input30.append(1_u64);
    input30.append(0_u64);
    input30.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input30,
        }
    );

    let mut input31 = ArrayTrait::new();
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(1_u64);
    input31.append(0_u64);
    input31.append(1_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(0_u64);
    input31.append(1_u64);
    input31.append(1_u64);
    input31.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input31,
        }
    );

    let mut input32 = ArrayTrait::new();
    input32.append(0_u64);
    input32.append(0_u64);
    input32.append(0_u64);
    input32.append(1_u64);
    input32.append(1_u64);
    input32.append(0_u64);
    input32.append(1_u64);
    input32.append(1_u64);
    input32.append(0_u64);
    input32.append(0_u64);
    input32.append(0_u64);
    input32.append(0_u64);
    input32.append(0_u64);
    input32.append(1_u64);
    input32.append(1_u64);
    input32.append(0_u64);
    input32.append(0_u64);
    input32.append(1_u64);
    input32.append(0_u64);
    input32.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input32,
        }
    );

    let mut input33 = ArrayTrait::new();
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    input33.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input33,
        }
    );

    let mut input34 = ArrayTrait::new();
    input34.append(1_u64);
    input34.append(0_u64);
    input34.append(0_u64);
    input34.append(1_u64);
    input34.append(0_u64);
    input34.append(1_u64);
    input34.append(0_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    input34.append(0_u64);
    input34.append(1_u64);
    input34.append(0_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    input34.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input34,
        }
    );

    let mut input35 = ArrayTrait::new();
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(0_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(0_u64);
    input35.append(0_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    input35.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input35,
        }
    );

    let mut input36 = ArrayTrait::new();
    input36.append(1_u64);
    input36.append(0_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(0_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(0_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(0_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    input36.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input36,
        }
    );

    let mut input37 = ArrayTrait::new();
    input37.append(1_u64);
    input37.append(0_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(0_u64);
    input37.append(0_u64);
    input37.append(0_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(0_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    input37.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input37,
        }
    );

    let mut input38 = ArrayTrait::new();
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    input38.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input38,
        }
    );

    let mut input39 = ArrayTrait::new();
    input39.append(1_u64);
    input39.append(0_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(0_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(0_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(1_u64);
    input39.append(0_u64);
    input39.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input39,
        }
    );

    let mut input40 = ArrayTrait::new();
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(1_u64);
    input40.append(1_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(1_u64);
    input40.append(1_u64);
    input40.append(1_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    input40.append(1_u64);
    input40.append(0_u64);
    input40.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input40,
        }
    );

    let mut input41 = ArrayTrait::new();
    input41.append(1_u64);
    input41.append(0_u64);
    input41.append(1_u64);
    input41.append(1_u64);
    input41.append(1_u64);
    input41.append(1_u64);
    input41.append(0_u64);
    input41.append(1_u64);
    input41.append(0_u64);
    input41.append(1_u64);
    input41.append(1_u64);
    input41.append(0_u64);
    input41.append(1_u64);
    input41.append(1_u64);
    input41.append(1_u64);
    input41.append(1_u64);
    input41.append(0_u64);
    input41.append(1_u64);
    input41.append(0_u64);
    input41.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input41,
        }
    );

    let mut input42 = ArrayTrait::new();
    input42.append(1_u64);
    input42.append(0_u64);
    input42.append(1_u64);
    input42.append(0_u64);
    input42.append(1_u64);
    input42.append(1_u64);
    input42.append(0_u64);
    input42.append(1_u64);
    input42.append(0_u64);
    input42.append(0_u64);
    input42.append(0_u64);
    input42.append(0_u64);
    input42.append(0_u64);
    input42.append(0_u64);
    input42.append(1_u64);
    input42.append(0_u64);
    input42.append(0_u64);
    input42.append(1_u64);
    input42.append(0_u64);
    input42.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input42,
        }
    );

    let mut input43 = ArrayTrait::new();
    input43.append(1_u64);
    input43.append(0_u64);
    input43.append(1_u64);
    input43.append(1_u64);
    input43.append(0_u64);
    input43.append(1_u64);
    input43.append(1_u64);
    input43.append(1_u64);
    input43.append(0_u64);
    input43.append(0_u64);
    input43.append(1_u64);
    input43.append(0_u64);
    input43.append(0_u64);
    input43.append(1_u64);
    input43.append(0_u64);
    input43.append(1_u64);
    input43.append(0_u64);
    input43.append(1_u64);
    input43.append(0_u64);
    input43.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input43,
        }
    );

    let mut input44 = ArrayTrait::new();
    input44.append(1_u64);
    input44.append(0_u64);
    input44.append(1_u64);
    input44.append(1_u64);
    input44.append(0_u64);
    input44.append(1_u64);
    input44.append(0_u64);
    input44.append(1_u64);
    input44.append(1_u64);
    input44.append(0_u64);
    input44.append(1_u64);
    input44.append(0_u64);
    input44.append(1_u64);
    input44.append(1_u64);
    input44.append(0_u64);
    input44.append(1_u64);
    input44.append(0_u64);
    input44.append(1_u64);
    input44.append(1_u64);
    input44.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input44,
        }
    );

    let mut input45 = ArrayTrait::new();
    input45.append(1_u64);
    input45.append(0_u64);
    input45.append(1_u64);
    input45.append(1_u64);
    input45.append(0_u64);
    input45.append(1_u64);
    input45.append(0_u64);
    input45.append(1_u64);
    input45.append(0_u64);
    input45.append(1_u64);
    input45.append(1_u64);
    input45.append(0_u64);
    input45.append(1_u64);
    input45.append(1_u64);
    input45.append(1_u64);
    input45.append(0_u64);
    input45.append(0_u64);
    input45.append(1_u64);
    input45.append(0_u64);
    input45.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input45,
        }
    );

    let mut input46 = ArrayTrait::new();
    input46.append(0_u64);
    input46.append(0_u64);
    input46.append(0_u64);
    input46.append(0_u64);
    input46.append(1_u64);
    input46.append(0_u64);
    input46.append(1_u64);
    input46.append(1_u64);
    input46.append(0_u64);
    input46.append(1_u64);
    input46.append(0_u64);
    input46.append(0_u64);
    input46.append(0_u64);
    input46.append(0_u64);
    input46.append(1_u64);
    input46.append(0_u64);
    input46.append(1_u64);
    input46.append(1_u64);
    input46.append(1_u64);
    input46.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input46,
        }
    );

    let mut input47 = ArrayTrait::new();
    input47.append(0_u64);
    input47.append(0_u64);
    input47.append(0_u64);
    input47.append(1_u64);
    input47.append(0_u64);
    input47.append(1_u64);
    input47.append(0_u64);
    input47.append(1_u64);
    input47.append(0_u64);
    input47.append(0_u64);
    input47.append(0_u64);
    input47.append(0_u64);
    input47.append(1_u64);
    input47.append(1_u64);
    input47.append(1_u64);
    input47.append(1_u64);
    input47.append(1_u64);
    input47.append(1_u64);
    input47.append(1_u64);
    input47.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input47,
        }
    );

    let mut input48 = ArrayTrait::new();
    input48.append(1_u64);
    input48.append(0_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(0_u64);
    input48.append(0_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(0_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(0_u64);
    input48.append(0_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    input48.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input48,
        }
    );

    let mut input49 = ArrayTrait::new();
    input49.append(1_u64);
    input49.append(0_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(0_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    input49.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input49,
        }
    );

    let mut input50 = ArrayTrait::new();
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(1_u64);
    input50.append(0_u64);
    input50.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input50,
        }
    );

    let mut input51 = ArrayTrait::new();
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(1_u64);
    input51.append(1_u64);
    input51.append(1_u64);
    input51.append(1_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(0_u64);
    input51.append(1_u64);
    input51.append(1_u64);
    input51.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input51,
        }
    );

    let mut input52 = ArrayTrait::new();
    input52.append(1_u64);
    input52.append(0_u64);
    input52.append(1_u64);
    input52.append(0_u64);
    input52.append(1_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    input52.append(1_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    input52.append(1_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    input52.append(1_u64);
    input52.append(0_u64);
    input52.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input52,
        }
    );

    let mut input53 = ArrayTrait::new();
    input53.append(0_u64);
    input53.append(0_u64);
    input53.append(1_u64);
    input53.append(1_u64);
    input53.append(1_u64);
    input53.append(1_u64);
    input53.append(1_u64);
    input53.append(1_u64);
    input53.append(0_u64);
    input53.append(1_u64);
    input53.append(0_u64);
    input53.append(0_u64);
    input53.append(1_u64);
    input53.append(1_u64);
    input53.append(1_u64);
    input53.append(0_u64);
    input53.append(0_u64);
    input53.append(1_u64);
    input53.append(0_u64);
    input53.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input53,
        }
    );

    let mut input54 = ArrayTrait::new();
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(1_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    input54.append(1_u64);
    input54.append(0_u64);
    input54.append(0_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input54,
        }
    );

    let mut input55 = ArrayTrait::new();
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    input55.append(1_u64);
    bloom_filters.append(
        BloomFilter{
            filters: input55,
        }
    );
    Discriminators {
        amount_layers: 56, amount_bits: 20, bloom_filters:  bloom_filters , 
    }
}
