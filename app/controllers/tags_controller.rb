class TagsController < ApplicationController
  
  # GET /tags
  # GET /tags.xml 
  def index
    @tags = Tag.find_popular(:limit => 50)   

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags.to_xml }
    end
  end
  
  # GET /tags/1
  # GET /tags/1.xml
  def show
    @tag = Tag.find_by_name(params[:id])
    @items = @tag.items.search(params[:search], params[:page]) if @tag
    
    respond_to do |format|
      format.html { render :template => "items/index" }
      format.xml  { render :xml => @items.to_xml }
    end
  end
end
