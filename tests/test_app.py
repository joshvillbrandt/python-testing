from app import algorithms


def test_add_two_numbers():
    assert algorithms.sum(1, 2) == 3
    assert algorithms.sum(5, 6) == 11
