Pakyow::App.routes do
  default do
    logger.info 'hello'
  end

  restful :link, "/links" do
    list do
      links = data(:link).all

      view.partial(:list).scope(:link).mutate(:list, with: links).subscribe

      # TODO this in effect adds attributes to the form in the view for
      # submitted params. See https://pakyow.org/docs/forms
      # TODO rather than binding a hash that fills out the needed properties
      # use a new, empty model.
      view.partial(:form).scope(:link).bind(url: "")
    end

    create do
      # TODO nothing like strong parameters I suppose?
      data(:link).create(params[:link])

      # TODO can I redirect "back"? Or at least have a path helper?
      redirect "/links"
    end
  end
end
