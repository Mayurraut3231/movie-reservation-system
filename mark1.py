class Movie:
    def __init__(self, title, showtimes, seats):
        self.title = title
        self.showtimes = {time: ['O'] * seats for time in showtimes}  # O = Open seat

    def display_showtimes(self):
        print(f"\nAvailable showtimes for {self.title}:")
        for time, seats in self.showtimes.items():
            print(f"{time} - {seats.count('O')} seats available")

    def reserve_seat(self, time, num_seats):
        if time in self.showtimes:
            available = self.showtimes[time].count('O')
            if available >= num_seats:
                count = 0
                for i in range(len(self.showtimes[time])):
                    if self.showtimes[time][i] == 'O':
                        self.showtimes[time][i] = 'X'
                        count += 1
                        if count == num_seats:
                            break
                print(f"Successfully reserved {num_seats} seat(s) for {self.title} at {time}.")
            else:
                print("Not enough seats available.")
        else:
            print("Invalid showtime.")


# Sample movies
movies = [
    Movie("Inception", ["10:00", "13:00", "16:00"], 10),
    Movie("The Matrix", ["11:00", "15:00"], 8),
]

def display_movies():
    print("\nNow Showing:")
    for idx, movie in enumerate(movies):
        print(f"{idx + 1}. {movie.title}")

while True:
    display_movies()
    choice = input("\nSelect a movie (enter number or 'q' to quit): ")
    if choice.lower() == 'q':
        print("Goodbye!")
        break
    if choice.isdigit() and 1 <= int(choice) <= len(movies):
        selected_movie = movies[int(choice) - 1]
        selected_movie.display_showtimes()
        time = input("Enter showtime: ")
        seats = int(input("How many seats would you like to reserve? "))
        selected_movie.reserve_seat(time, seats)
    else:
        print("Invalid selection.")
