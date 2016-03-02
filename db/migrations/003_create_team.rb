Sequel.migration do
  change do
    create_table(:teams) do
      primary_key :id
      String :name
      Integer :captain_id
      String :motto
    end
  end
end