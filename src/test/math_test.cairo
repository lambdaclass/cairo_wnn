use cairo_wnn::math;

#[test]
fn test_math() {
    assert(math::add(2, 3) == 5, 'invalid');
}
