Pakyow::App.mutable :link do
  action :create do |params|
    attributes = { created_at: Time.now, updated_at: Time.now }.merge(params)
    rom.command(:links).create.call(attributes)
  end

  action :delete do |id|
    rom.relation(:links).where(id: id).delete
  end
end
