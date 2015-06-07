require 'spec_helper'
require 'movie_theater'

describe MovieTheater do
  describe "#attributes" do
    it 'is initialized with a number of available seats, as well as movies and their respective showtimes' do
      theater = MovieTheater.new(100, { "Star Wars" => ["9:10", "12:30"]})

      expect(theater.available_seats).to eq(100)
      expect(theater.movies).to eq({ "Star Wars" => ["9:10", "12:30"]})
    end
  end

  describe "#sell_tickets" do
    it 'occupies available seats' do
      theater = MovieTheater.new(100, { "Star Wars" => ["9:10", "12:30"]})
      theater.sell_tickets(2)

      expect(theater.available_seats).to eq(98)
    end
  end

  describe "#add_showtime" do
    it "adds a showtime to a movie" do
      theater = MovieTheater.new(100, { "Star Wars" => ["9:10", "12:30"]})

      theater.add_showtime("Star Wars", "4:20")
      expect(theater.movies).to eq({ "Star Wars" => ["9:10", "12:30", "4:20"]})
    end
  end

  describe "#add_movie" do
    it "adds a movie" do
      theater = MovieTheater.new(100, { "Star Wars" => ["9:10", "12:30"]})
      theater.add_showtime("Star Wars", "4:20")
      
      theater.add_movie("Mad Max", "5:45")
      expect(theater.movies).to eq({ "Star Wars" => ["9:10", "12:30", "4:20"], "Mad Max" => ["5:45"]})
    end
  end

end
