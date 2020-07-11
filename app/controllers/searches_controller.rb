class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
    @blog = Blog.new
    @model = params['search']['model']
    @content = params['search']['content']
    @how = params['search']['how']
    @datas = search_for(@how, @model, @content)
  end

  private

  def partical(model, content)
    if model == 'blog'
      Blog.where('body LIKE ?', "%#{content}%")
    elsif model == 'user'
      User.where('name LIKE ?', "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'partical'
      partical(model, content)
    end
  end
end
