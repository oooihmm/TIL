import unittest

def first_function():
    pass

class FirstTest(unittest.TestCase):

    def test_first(self):
        first_function()

if __name__ == '__main__':
    unittest.main()