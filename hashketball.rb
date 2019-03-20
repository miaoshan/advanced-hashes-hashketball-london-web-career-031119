require 'pry'


 def game_hash
 {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
 }
 end


def num_points_scored (name)
  result = nil
    game_hash.each do |team, details_hash|
    players_array= details_hash[:players]  #home or away
      players_array.each do |player_details_hash|
        if player_details_hash[:name] == name
          result = player_details_hash[:points]
        end
      end
  end
  result
end

def shoe_size(name)
  result =nil
  game_hash.each do |team, details_hash|
    players_array = details_hash[:players]
    players_array.each do |player_details_hash|
      if player_details_hash [:name] ==name
        result = player_details_hash[:shoe]
      end
    end
  end
  result
end

def team_colors(name)
  result=nil
  game_hash.each do |team, details_hash|
    if details_hash[:team_name]== name
      result= details_hash[:colors]
    end
  end
  result
end

def team_names
  game_hash.collect do |team, details_hash|
    details_hash[:team_name]
  end
end

def player_numbers (team_name)
  player_numbers_list = []
  game_hash.each do |team, details_hash|
    if details_hash[:team_name] == team_name
      details_hash[:players].each do |player|
        player.each do |key, value|
          if key == :number
            player_numbers_list << value
          end
        end
      end
    end
  end
  player_numbers_list
end



def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, details_hash|
    details_hash[:players].each do |stats|
        if stats[:name] == player_name
        stats.delete(:name)
        player_stats = stats
      end
    end
  end
  player_stats
end

  def big_shoe_rebounds
    biggest_shoe_player=0
    rebounds=0
    game_hash.each do |team, details_hash|
      details_hash [:players].each do |stats|
        if stats[:shoe] > biggest_shoe_player
          biggest_shoe_player=stats[:shoe]
          rebounds=stats[:rebounds]
        end
      end
    end
    return rebounds
  end


 def most_points_scored
    player=nil
    most_points=0
    game_hash.each do |team, details_hash|
      details_hash[:players].each do |value|
        if value[:points]>most_points
          most_points=value[:points]
          player=value[:name]
        end
      end
    end
    player
  end


  def winning_team
     home_points=0
     away_points=0
     game_hash[:home][:players].each do |value|
       home_points+=value[:points]
     end
     game_hash[:away][:players].each do |value|
       away_points+=value[:points]
     end
     if home_points>away_points
       game_hash[:home][:team_name]
     elsif away_points>home_points
       game_hash[:away][:team_name]
     else
       "The two teams tie."
     end
   end


   def player_with_longest_name
       player_name= nil
       longest_word=0
       game_hash.each do |team, details_hash|
       details_hash[:players].each do |value|
       if value[:name].length>longest_word
         longest_word=value[:name]
         player_name= value[:name]
       end
     end
   end
   player_name
 end

 def long_name_steals_a_ton?
   player_name=nil
   longest_word =0
   most_steals=0
   game_hash.each do |team,details_hash|
     details_hash[:players].each do |value|
       if value[:name].length >longest_word
         longest_word=value[:name]
         player=value
      end
      if value[:steals]>most_steals
        most_steals=value[:steals]
       end
     end
   end
      if player[:steals]==most_steals
        true
      end
end
