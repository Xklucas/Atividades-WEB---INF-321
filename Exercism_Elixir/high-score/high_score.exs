defmodule HighScore do
  @initial_score 0

  def new do
    %{}
  end

  def add_player(scores, name, score \\ @initial_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    add_player(scores, name)
  end

  def update_score(scores, name, points) do
    previous_score = Map.get(scores, name, @initial_score)
    Map.put(scores, name, previous_score + points)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
