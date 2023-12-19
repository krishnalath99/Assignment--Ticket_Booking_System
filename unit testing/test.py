import unittest

from dao.BookingSystemServiceProvider import TicketBookingSystem

class TestTBS(unittest.TestCase):
    def test_event_creation(self):
        result  = TicketBookingSystem().create_event(event_name='Test Event', date='2024-01-01', time='00:00:00', venue_id=1, total_seats=10, available_seats=10, ticket_price=1, event_type='Concert')
        self.assertEqual(result, True, 'Event Creation Successfull')

if __name__ == '__main__':
    unittest.main()
