import mysql.connector as connection

from util.DBConnUtil import DbConn

from entity.Booking import Booking

class TicketBookingSystem(DbConn):
    def __init__(self):
        pass

    def create_event(self, event_name, date, time, venue_id, total_seats, available_seats, ticket_price, event_type):
        try:
            self.open()
            self.c.execute(f"Insert Into Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) Values ('{event_name}', '{date}', '{time}', {venue_id}, {total_seats}, {available_seats}, {ticket_price}, '{event_type}')")
            self.mydb.commit()
            self.close()
        except Exception as e:
            print(e)
            return False
        else:
            print('\nEvent Added Successfully...\nRedirecting to the Main Menu...')
            return True
            
    def display_event_details(self, eveob):      
        eveob.display_event_details()

    def book_tickets(self, eveob, num_tickets):
        nam = input('Enter Your Name : ')
        eml = input('Enter You Email-ID : ')
        ph = input('Enter Your Phone Number : ')
        self.open()
        self.c.execute(f"Insert Into Customer (customer_name, email, phone_number) Values ('{nam}', '{eml}', '{ph}')")
        self.mydb.commit()
        cid = self.c.lastrowid
        self.close()
        eid = eveob.get_event_id()
        Booking(customer_id=cid, event_id=eid, num_tickets=num_tickets).book_tickets()

    def cancel_tickets(self, eveob, num_tickets):
        eveob.cancel_booking(num_tickets)