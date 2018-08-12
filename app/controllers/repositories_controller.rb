class RepositoriesController < ApplicationController

  def search
    @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
        #req.params['client_id'] = client_id
        #req.params['client_secret'] = client_secret
        #req.params['v'] = '20160201'
        req.params['q'] = params[:query]
        #req.options.timeout = 0
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      #else
      #  @error = body["meta"]["errorDetail"]
      end
    render 'search'
  end

  def github_search
  end
end
