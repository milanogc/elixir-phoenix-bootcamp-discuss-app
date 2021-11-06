defmodule Discuss.Repo.Migrations.AddUserIdToTopic do
  use Ecto.Migration

  def change do
    alter table(:topic) do
      add :user_id, references(:user)
    end
  end
end
