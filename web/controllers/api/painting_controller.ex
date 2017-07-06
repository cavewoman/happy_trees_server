defmodule HappyTreesServer.API.PaintingController do
  use HappyTreesServer.Web, :controller

  alias HappyTreesServer.Painting

  def index(conn, _params) do
    paintings = Repo.all(Painting)
    json conn, paintings
  end

  def update(conn, %{"paintings" => paintings}) do
    {status, paintings} = update_or_create_paintings(paintings, {:ok, []})
    json conn, %{status: status, paintings: paintings}
  end

  def update_or_create_paintings(_, {:error, message}), do: {:error, message}
  def update_or_create_paintings([], status), do: status
  def update_or_create_paintings([head| tail], {_, paintings}) do
    painting = Repo.get_by(Painting, painting_key: head["painting_key"])

    if (painting) do
      {update_status, updated_painting} = update_painting(painting, head)
      update_or_create_paintings(tail, {update_status, [updated_painting | paintings]})
    else
      {create_status, created_painting} = create_painting(head)
      update_or_create_paintings(tail, {create_status, [created_painting | paintings]})
    end
  end

  def update_painting(painting, painting_params) do
    changeset = Painting.changeset(painting, painting_params)
    Repo.update(changeset)
  end

  def create_painting(painting_params) do
    changeset = Painting.changeset(%Painting{}, painting_params)
    Repo.insert(changeset)
  end
end
