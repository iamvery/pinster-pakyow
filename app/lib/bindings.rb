Pakyow::App.bindings do
  scope :link do
    binding :url do
      {
        href: bindable[:url],
        content: bindable[:url],
      }
    end
  end
end
