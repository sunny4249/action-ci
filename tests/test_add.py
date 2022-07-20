import pytest
from action import add_two


@pytest.mark.parametrize(
    "x,y",
    [
        (
            1, 2
        )
    ]
)
def test_add(x, y):
    result = add_two(x, y)
    assert result == 3