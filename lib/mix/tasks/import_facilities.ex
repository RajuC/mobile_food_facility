defmodule Mix.Tasks.ImportFacilities do
    use Mix.Task
  
    def run(path) do
      Mix.Task.run("app.start", [])
  
      opts = MobileFoodFacility.Repo.config()
      {:ok, pid} = Postgrex.start_link(opts)
  
      Postgrex.transaction(
        pid, 
        fn conn ->
          stream =
            Postgrex.stream(
              conn,
              "COPY facilities(location_id,applicant,type,cnn,location_description,address,block_lot,block,lot,permit,status,food_items,x,y,latitude,longitude,schedule,days_hours,noi_sent_date,approved_date,received_day,prior_permit,expiration_date,location,fire_prevention_districts_count,police_districts_count,supervisor_districts_count,zip_codes,old_neighborhoods_count) FROM STDIN CSV HEADER DELIMITER ','",
              []
            )
  
          Enum.into(File.stream!(path, [:trim_bom]), stream)
        end,
        timeout: :infinity
      )
    end
  end