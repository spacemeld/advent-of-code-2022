#!/usr/bin/env ruby

class Calories
    INPUT_FILE = "input.txt"

    @collection_of_total_calories_for_elves
    @total_calories_for_an_elf

    def initialize
        @collection_of_total_calories_for_elves = Array.new
        @total_calories_for_an_elf = 0
    end

    def run
        file = File.new(INPUT_FILE)

        file.each_line do |line|
            if line.strip! != ""
                @total_calories_for_an_elf = @total_calories_for_an_elf + line.to_i
            else
                @collection_of_total_calories_for_elves.push(@total_calories_for_an_elf)

                @total_calories_for_an_elf = 0
            end
        end

        # sort by descending so largest total amounts of calories will be first
        @collection_of_total_calories_for_elves = @collection_of_total_calories_for_elves.sort.reverse

        puts "Total calories for the largest three elves in carrying food: #{@collection_of_total_calories_for_elves.take(3).sum}"
    end
end

calories = Calories.new
calories.run