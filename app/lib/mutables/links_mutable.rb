Pakyow::App.mutable :link do
  query :all do
    rom.relation(:links).to_a
  end

  action :create do |params|
    attributes = { created_at: Time.now, updated_at: Time.now }.merge(params)
    rom.command(:links).create.call(attributes)
  end
end
