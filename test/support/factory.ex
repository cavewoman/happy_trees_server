defmodule HappyTreesServer.Factory do
  use ExMachina.Ecto, repo: HappyTreesServer.Repo
  alias HappyTreesServer.Supply
  alias HappyTreesServer.Favorite

  def favorite_factory do
    %Favorite{
      title: sequence(:title, &"favorite_title_#{&1}"),
      url: sequence(:url, &"website_#{&1}.com"),
      favorite_key: sequence(:favorite_key, &"favorite_key_#{&1}")
    }
  end

  def favorite_factory(attrs) do
    %Favorite{
      title: attrs[:title] || sequence(:title, &"favorite_title_#{&1}"),
      url: attrs[:url] || sequence(:url, &"website_#{&1}.com"),
      favorite_key: attrs[:favorite_key] || sequence(:favorite_key, &"favorite_key_#{&1}")
    }
  end

  def supply_factory do
    types = ["Oil Paint", "Acrylic Paint", "Brush", "Canvas", "Medium"]
    amounts = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
    %Supply{
      name: sequence(:name, &"supply_name_#{&1}"),
      type: Enum.random(types),
      amount: Enum.random(amounts),
      supply_key: sequence(:supply_key, &"supply_key_#{&1}")
    }
  end

  def supply_factory(attrs) do
    types = ["Oil Paint", "Acrylic Paint", "Brush", "Canvas", "Medium"]
    amounts = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
    %Supply{
      name: attrs[:name] || sequence(:name, &"supply_name_#{&1}"),
      type: attrs[:type] || Enum.random(types),
      amount: attrs[:amount] || Enum.random(amounts),
      supply_key: attrs[:supply_key] || sequence(:supply_key, &"supply_key_#{&1}")
    }
  end
end
