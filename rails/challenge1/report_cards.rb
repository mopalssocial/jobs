class ReportCards
  class << self
    # Takes a has containing the students' report cards and returns an array of hashes, each one representing the best student for the subject.
    # Example input:

    # { 
    #     "bobby crimble" => { "math" => 68, "physics" => 77, ... },
    #     "little susie johnson" => { "music" => 88, "math" => 91,  ... },
    #     "aisha sarkis" => { "math" => 96, "music" => 77, "art" => 88, ... }
    #     ...
    # }

    # Example output:

    # [ 
    #   { "math" => "aisha sarkis" }, 
    #   { "music" => "little susie johnson" }, 
    #   ...
    # ]
    def best_students(report_cards)

    end
  end
end