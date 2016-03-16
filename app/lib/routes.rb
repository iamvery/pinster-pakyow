Pakyow::App.routes do
  default do
    logger.info 'hello'
  end

  restful :link, "/links" do
    list do
      links = rom.relation(:links).to_a

      view.partial(:list).scope(:link).apply(links)

      # TODO this in effect adds attributes to the form in the view for
      # submitted params. See https://pakyow.org/docs/forms
      # TODO rather than binding a hash that fills out the needed properties
      # use a new, empty model.
      view.partial(:form).scope(:link).bind(url: "")
    end
  end
end
