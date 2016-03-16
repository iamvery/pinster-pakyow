Pakyow::App.routes do
  default do
    logger.info 'hello'
  end

  restful :link, "/links" do
    list do
      links = Pakyow::Config.app.rom.relation(:links).to_a

      view.scope(:link).apply(links) do |view, datum|
        view.prop(:url).attrs[:href] = datum.fetch(:url)
      end
    end
  end
end
