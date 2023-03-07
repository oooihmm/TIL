import unittest

class MyTestCase(unittest.TestCase):
    def setUp(self):
        # Set up some resources that will be used by the tests
        self.my_list = [1, 2, 3]

    def tearDown(self):
        # Clean up the resources after the tests are done
        self.my_list = None

    def test_list_contains_numbers(self):
        self.assertIn(1, self.my_list)
        self.assertIn(2, self.my_list)
        self.assertIn(3, self.my_list)

    def test_list_does_not_contain_letters(self):
        self.assertNotIn('a', self.my_list)
        self.assertNotIn('b', self.my_list)
        self.assertNotIn('c', self.my_list)

# unittest를 실행
if __name__ == '__main__':
    unittest.main()