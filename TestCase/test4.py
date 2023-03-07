import unittest

class TestMath(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # print("Setting up the TestMath class...")
        cls.a = 10
        cls.b = 5

    @classmethod
    def tearDownClass(cls):
        # print("Tearing down the TestMath class...")
        cls.a = None
        cls.b = None

    def setUp(self):
        # print("Setting up the TestMath test case...")
        self.result = 0

    def tearDown(self):
        # print("Tearing down the TestMath test case...")
        self.result = None

    def test_addition(self):
        # print("Testing addition...")
        self.result = self.a + self.b
        self.assertEqual(self.result, 15)

    def test_subtraction(self):
        # print("Testing subtraction...")
        self.result = self.a - self.b
        self.assertEqual(self.result, 5)

    def test_multiplication(self):
        # print("Testing multiplication...")
        self.result = self.a * self.b
        self.assertEqual(self.result, 50)

if __name__ == '__main__':
    # print("Running the TestMath module...")
    unittest.main()
