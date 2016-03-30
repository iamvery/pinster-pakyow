Pakyow::App.mutators :link do
  mutator :list do |view, data|
    view.apply(data)
  end
end
