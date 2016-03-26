Pakyow::App.bindings do
  scope :link do
    restful :link

    # TODO https://github.com/iamvery/pinster-pakyow/pull/7#issuecomment-197944275
    binding :url do
      {
        href: bindable[:url],
        content: bindable[:url],
      }
    end
  end
end
