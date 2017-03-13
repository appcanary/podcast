module AppHelpers
  def tags?(article = current_article)
    article.tags.present?
  end

  def tags(article = current_article, separator = ', ')

    article.tags.map do |tag|
      link_to(tag, tag_path(tag))
    end.join(separator)
  end

  def post_author(article = current_article)
    author = article.metadata[:page][:author]
    author ||= "team"
    OpenStruct.new(config.authors[author])
  end

  def author_path(article)
    "/author/#{post_author(article).name.parameterize}.html"
  end


end
