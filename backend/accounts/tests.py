import email
from django.contrib.auth import get_user_model
from django.test import TestCase


class UserModelTests(TestCase):

    def test_create_superuser(self):
        db = get_user_model()
        user = db.objects.create_superuser('demo@demo.com', 'demo', 'demo1234')
        # Fields
        self.assertEqual(user.email, 'demo@demo.com')
        self.assertEqual(user.name, 'demo')
        # Permissions
        self.assertTrue(user.is_superuser)
        self.assertTrue(user.is_admin)
        self.assertTrue(user.is_active)
        self.assertTrue(user.is_staff)
        # Return string
        self.assertEqual(str(user), 'demo')

        # Email not present
        with self.assertRaises(ValueError):
            db.objects.create_superuser(
                email='', name='demo', password='demo1234')
        # Name not present
        with self.assertRaises(ValueError):
            db.objects.create_superuser(
                email='demo@demo.com', name='', password='1234')
