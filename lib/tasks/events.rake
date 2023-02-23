namespace :events do
  desc "Seeds the Event table"
  task fetch: :environment do
    CreateEventsWorker.perform_sync
    puts 'Success'
  end
end
