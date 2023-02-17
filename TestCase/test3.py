import unittest

def add(a, b):
    return a + b

class TestAddition(unittest.TestCase):
    def test_add_integers(self):
        self.assertEqual(add(2, 3), 5)
        self.assertNotEqual(add(-1, 1), 0)

    def test_add_floats(self):
        self.assertAlmostEqual(0.98, 1)

if __name__ == '__main__':
    unittest.main()