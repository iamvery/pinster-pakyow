Pakyow::App.bindings do
  scope :link do
    restful :link

    binding :url do
      {
        href: bindable[:url],
        content: bindable[:url],
      }
    end
  end
end
