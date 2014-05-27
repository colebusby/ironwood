def add_board_positions
  board_positions = [
    {position_params:{
      id:     1,
      title:  "cement"
    }
    },

    {position_params:{
      id:     2,
      title:  "overall condition of condos"
    }
    },

    {position_params:{
      id:     3,
      title:  "ground-North side"
    }
    },

    {position_params:{
      id:     4,
      title:  "grounds-South side"
    }
    },

    {position_params:{
      id:     5,
      title:  "snow removal"
    }
    },

    {position_params:{
      id:     6,
      title:  "painting"
    }
    },

    {position_params:{
      id:     7,
      title:  "roofing and rain gutters"
    }
    },

    {position_params:{
      id:     8,
      title:  "secretary"
    }
    },

    {position_params:{
      id:     9,
      title:  "R.V. Lot"
    }
    },

    {position_params:{
      id:     10,
      title:  "Treasurer"
    }
    },

    {position_params:{
      id:     11,
      title:  "Insurance"
    }
    },
  ]

  board_positions.each do |board_position|
    unless BoardPosition.find_by_id(board_position[:position_params][:id])
      BoardPosition.create!(board_position[:position_params])
    end
  end
  puts "board positions added"
end

namespace :db do
  desc "Add board positions"
  task add_board_positions: :environment do
    add_board_positions
  end
end