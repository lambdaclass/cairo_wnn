use array::ArrayTrait;
use traits::TryInto;
use traits::Into;

#[derive(Copy, Drop)]
struct Decomposition {
    index1: felt252,
    index2: felt252,
    msb: felt252,
}

#[derive(Copy, Drop)]
struct HashValue {
    hash: felt252,
    quotient: felt252,
    decomposition: Decomposition,
}

trait HashValueTrait {
    fn validate_hash(self: @HashValue, input: u64) -> bool;
    fn validate_bit_decomposition(self: @HashValue) -> bool;
}

impl HashValueTraitImpl of HashValueTrait {
    fn validate_hash(self: @HashValue, input: u64) -> bool {
        let inputf252 = input.into();
        let x3 = inputf252 * inputf252 * inputf252;
        let aux = *self.quotient * 2097143_felt252 + *self.hash;
        return x3 == aux;
    }

    fn validate_bit_decomposition(self: @HashValue) -> bool {
        //ToDo check if the hash length
        let x = *self.decomposition.msb * 1024_felt252 + *self.decomposition.index2;
        let x = x * 1024_felt252 + *self.decomposition.index1;
        return x == *self.hash;
    }
}

fn load_hash_values() -> Array<HashValue> {
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
    hash_values.append(
        HashValue {
            hash: 88833_felt252,
            quotient: 1410232109894402169_felt252,
            decomposition: Decomposition {
                index1: 769_felt252, index2: 86_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 352523_felt252,
            quotient: 2487955629421481691_felt252,
            decomposition: Decomposition {
                index1: 267_felt252, index2: 344_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 710215_felt252,
            quotient: 8957315789379204136_felt252,
            decomposition: Decomposition {
                index1: 583_felt252, index2: 693_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1540319_felt252, quotient: 671830815964263_felt252, decomposition: Decomposition {
                index1: 223_felt252, index2: 480_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 233346_felt252,
            quotient: 32720003209961237_felt252,
            decomposition: Decomposition {
                index1: 898_felt252, index2: 227_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1071420_felt252,
            quotient: 118985436089155572_felt252,
            decomposition: Decomposition {
                index1: 316_felt252, index2: 22_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 659930_felt252,
            quotient: 4566793772572173267_felt252,
            decomposition: Decomposition {
                index1: 474_felt252, index2: 644_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1438072_felt252,
            quotient: 1356473119879030335_felt252,
            decomposition: Decomposition {
                index1: 376_felt252, index2: 380_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 201403_felt252,
            quotient: 6011616527736608675_felt252,
            decomposition: Decomposition {
                index1: 699_felt252, index2: 196_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 431159_felt252,
            quotient: 7894169591572351516_felt252,
            decomposition: Decomposition {
                index1: 55_felt252, index2: 421_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 230855_felt252,
            quotient: 277928543989732623_felt252,
            decomposition: Decomposition {
                index1: 455_felt252, index2: 225_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 222448_felt252,
            quotient: 1974211924576835632_felt252,
            decomposition: Decomposition {
                index1: 240_felt252, index2: 217_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 995935_felt252,
            quotient: 3943447135857895719_felt252,
            decomposition: Decomposition {
                index1: 607_felt252, index2: 972_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1879882_felt252,
            quotient: 693654305436699099_felt252,
            decomposition: Decomposition {
                index1: 842_felt252, index2: 811_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 883916_felt252,
            quotient: 27941179773368349_felt252,
            decomposition: Decomposition {
                index1: 204_felt252, index2: 863_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 2008157_felt252,
            quotient: 1031276587004402702_felt252,
            decomposition: Decomposition {
                index1: 93_felt252, index2: 937_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 65477_felt252,
            quotient: 551196526326808285_felt252,
            decomposition: Decomposition {
                index1: 965_felt252, index2: 63_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1875740_felt252,
            quotient: 7997913510759003452_felt252,
            decomposition: Decomposition {
                index1: 796_felt252, index2: 807_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1669923_felt252,
            quotient: 102056179116790539_felt252,
            decomposition: Decomposition {
                index1: 803_felt252, index2: 606_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1286650_felt252,
            quotient: 298712700875277234_felt252,
            decomposition: Decomposition {
                index1: 506_felt252, index2: 232_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 154671_felt252,
            quotient: 3924456192427580276_felt252,
            decomposition: Decomposition {
                index1: 47_felt252, index2: 151_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1229239_felt252,
            quotient: 521933367263163327_felt252,
            decomposition: Decomposition {
                index1: 439_felt252, index2: 176_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 116095_felt252,
            quotient: 2400157088077084358_felt252,
            decomposition: Decomposition {
                index1: 383_felt252, index2: 113_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1262185_felt252,
            quotient: 2388552416076129_felt252,
            decomposition: Decomposition {
                index1: 617_felt252, index2: 208_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 769014_felt252,
            quotient: 361846940740203599_felt252,
            decomposition: Decomposition {
                index1: 1014_felt252, index2: 750_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 451327_felt252,
            quotient: 569810880694938802_felt252,
            decomposition: Decomposition {
                index1: 767_felt252, index2: 440_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 848251_felt252,
            quotient: 1185816667576162752_felt252,
            decomposition: Decomposition {
                index1: 379_felt252, index2: 828_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 610894_felt252,
            quotient: 6822523526149194742_felt252,
            decomposition: Decomposition {
                index1: 590_felt252, index2: 596_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1557318_felt252,
            quotient: 1127026993414358_felt252,
            decomposition: Decomposition {
                index1: 838_felt252, index2: 496_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1152299_felt252,
            quotient: 5522522059822786032_felt252,
            decomposition: Decomposition {
                index1: 299_felt252, index2: 101_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 318983_felt252,
            quotient: 3024138553185051023_felt252,
            decomposition: Decomposition {
                index1: 519_felt252, index2: 311_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1216473_felt252, quotient: 26283040_felt252, decomposition: Decomposition {
                index1: 985_felt252, index2: 163_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1935547_felt252,
            quotient: 457998228378923875_felt252,
            decomposition: Decomposition {
                index1: 187_felt252, index2: 866_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 790077_felt252,
            quotient: 2233252634330112493_felt252,
            decomposition: Decomposition {
                index1: 573_felt252, index2: 771_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 212020_felt252,
            quotient: 2585211939861647219_felt252,
            decomposition: Decomposition {
                index1: 52_felt252, index2: 207_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 468975_felt252,
            quotient: 7484939552204305032_felt252,
            decomposition: Decomposition {
                index1: 1007_felt252, index2: 457_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 106580_felt252,
            quotient: 12578741941077876_felt252,
            decomposition: Decomposition {
                index1: 84_felt252, index2: 104_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1501878_felt252,
            quotient: 3338568168180825_felt252,
            decomposition: Decomposition {
                index1: 694_felt252, index2: 442_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1748379_felt252,
            quotient: 548109991716282048_felt252,
            decomposition: Decomposition {
                index1: 411_felt252, index2: 683_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1874363_felt252,
            quotient: 1383418600254977883_felt252,
            decomposition: Decomposition {
                index1: 443_felt252, index2: 806_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 30354_felt252,
            quotient: 3227059544443872649_felt252,
            decomposition: Decomposition {
                index1: 658_felt252, index2: 29_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 72113_felt252, quotient: 53195622509303986_felt252, decomposition: Decomposition {
                index1: 433_felt252, index2: 70_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 840200_felt252,
            quotient: 6967419704808326536_felt252,
            decomposition: Decomposition {
                index1: 520_felt252, index2: 820_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 2069695_felt252,
            quotient: 1301278944564285327_felt252,
            decomposition: Decomposition {
                index1: 191_felt252, index2: 997_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 392246_felt252, quotient: 8391738999949909_felt252, decomposition: Decomposition {
                index1: 54_felt252, index2: 383_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 34499_felt252,
            quotient: 4249067765961153251_felt252,
            decomposition: Decomposition {
                index1: 707_felt252, index2: 33_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1270036_felt252,
            quotient: 5004557165201443623_felt252,
            decomposition: Decomposition {
                index1: 276_felt252, index2: 216_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 274687_felt252, quotient: 1395336247061191_felt252, decomposition: Decomposition {
                index1: 255_felt252, index2: 268_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 728956_felt252,
            quotient: 6241456837288611515_felt252,
            decomposition: Decomposition {
                index1: 892_felt252, index2: 711_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1846968_felt252,
            quotient: 6361817545402576_felt252,
            decomposition: Decomposition {
                index1: 696_felt252, index2: 779_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 289971_felt252,
            quotient: 3026237146351236828_felt252,
            decomposition: Decomposition {
                index1: 179_felt252, index2: 283_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 397126_felt252, quotient: 6801204568037526_felt252, decomposition: Decomposition {
                index1: 838_felt252, index2: 387_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 234577_felt252,
            quotient: 47050762413515337_felt252,
            decomposition: Decomposition {
                index1: 81_felt252, index2: 229_felt252, msb: 0_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1250502_felt252,
            quotient: 6649287143220352598_felt252,
            decomposition: Decomposition {
                index1: 198_felt252, index2: 197_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values.append(
        HashValue {
            hash: 1663047_felt252,
            quotient: 5694703302057726439_felt252,
            decomposition: Decomposition {
                index1: 71_felt252, index2: 600_felt252, msb: 1_felt252, 
            },
        }
    );
    hash_values
}

