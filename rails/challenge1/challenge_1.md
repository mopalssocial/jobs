# Challenge 1

The purpose of this challenge is to asses your familiarity with working with Ruby. Each question will ask you to create a `.rb` file for your solution. Please include it in the `challenge1` folder when submitting your work. Include any comments that you would like to. If your solution requires a particular version of ruby to run, please specify in the comments.

## Question 1

In the file `email_validator.rb`, please complete the function `validate(email)` which takes a string and returns true if it matches a valid "@mopals.com" email address.

## Question 2

In the file `arranger.rb`, please complete the function `arrange_string(str)`, which takes a string containing a sentence (_n_ number of whitespace-separated word token) and returns that setence rearranged in non-descending order of word length.

For example, `arrange_string("Where sharing is rewarding") -> "is Where sharing rewarding"`

## Question 3

In a file called `report_cards.rb`, please write a function `best_students(report_cards)` which takes a has containing the students' report cards and returns an array of hashes, each one representing the best student for the subject.

Example input:

    { 
        "bobby crimble" => { "math" => 68, "physics" => 77, ... },
        "little susie johnson" => { "music" => 88, "math" => 91,  ... },
        "aisha sarkis" => { "math" => 96, "music" => 77, "art" => 88, ... }
        ...
    }

Example output:

    [ 
      { "math" => "aisha sarkis" }, 
      { "music" => "little susie johnson" }, 
      ...
    ]
