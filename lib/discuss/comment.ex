# mix phx.gen.schema Topic topic title:string
# mix ecto.migrate

defmodule Discuss.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:content, :user]}

  schema "comment" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  @doc false
  def changeset(topic, attrs \\ %{}) do
    topic
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
