class CaRatingsController < ApplicationController
  def mass_create
    params['params'].each do |p|
      @rating = CaRating.new

      @rating.rate_id = p[1]['rate_id']
      @rating.issue_id = p[1]['issue_id']
      @rating.type_id = p[1]['type_id']
      @rating.value = p[1]['value']
      @rating.author_role_id = p[1]['author_role_id']
      @rating.author_id = p[1]['author_id']

      @rating.save
    end
  end

  def show_by_rate_id
    @rate = Rate.find(params[:id])
    @ratings = CaRating.where(rate_id: rate.id)
  end

  def edit_by_rate_id
    @rate = Rate.find(params[:id])
    @ratings = CaRating.where(rate_id: @rate.id)
  end

  def mass_update
    rate = Rate.find(params['params']['id'])
    @ratings = CaRating.where(rate_id: rate.id)

    params['params'].each do |p|

      unless p[0] == 'id'
        if @ratings.count - 1 < p[0].to_i
          @rating = CaRating.new

          @rating.rate_id = p[1]['rate_id']
          @rating.issue_id = p[1]['issue_id']
          @rating.type_id = p[1]['type_id']
          @rating.value = p[1]['value']
          @rating.author_role_id = p[1]['author_role_id']
          @rating.author_id = p[1]['author_id']

          @rating.save
        else
          rating = @ratings[p[0].to_i]

          rating.rate_id = p[1]['rate_id']
          rating.issue_id = p[1]['issue_id']
          rating.type_id = p[1]['type_id']
          rating.value = p[1]['value']
          rating.author_role_id = p[1]['author_role_id']
          rating.author_id = p[1]['author_id']

          rating.save
        end
      end
    end
  end

  def new
    @rating = CaRating.new
  end

  def create
    rating_params = params.require(:rating).permit(
      :rate_id, :issue_id, :type_id, :value, :author_role_id, :author_id
    )

    @rating = CaRating.new(rating_params)

    @rating.save
    redirect_to @rating
  end

  def edit
    @rating = CaRating.find(params[:id])
  end

  def update
    @rating = CaRating.find(params[:id])

    rating_params = params.require(:rating).permit(
      :rate_id, :issue_id, :type_id, :value, :author_role_id, :author_id
    )

    @rating.update(rating_params)
    redirect_to @rating
  end

  def show
    @rating = CaRating.find(params[:id])
  end

  def delete
  end
end
