Pakyow::App.routes do
  default do
    logger.info 'hello'
  end

  restful :link, "/links" do
    list do
      links = Pakyow::Config.app.rom.relation(:links).to_a

      view.partial(:list).scope(:link).apply(links)
    end
  end
end
