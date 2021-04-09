"""Tests for the hello module."""
import hello
import unittest
import unittest.mock as mock
from io import StringIO


class MyTestCase(unittest.TestCase):
    """Test functions from the hello module."""
    def test_get_message(self):
        actual = hello.get_message()
        expected = "I ♡ templates"
        self.assertEqual(expected, actual)

    def test_main(self):
        # Redirect stdout
        with mock.patch("sys.stdout", new=StringIO()) as mock_out:
            hello.main()

        actual = mock_out.getvalue().strip().split("\n")
        expected = ["I ♡ templates", "I ♡ templates"]
        self.assertListEqual(expected, actual)

    @unittest.skip
    def test_new_function(self):
        actual = hello.new_function(15)
        expected = 32
        self.assertEqual(expected, actual)
