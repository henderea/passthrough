class PassthroughController < ApplicationController
  def main
    path = params[:path] || ''
    if path.length > 0 && path[0] != '/'
      path = "/#{path}"
    end
    logger.debug "Posting to http://#{params[:dest]}.droplet.henderea.com#{path}/#{params[:act]}"
    data = params[:passthrough].to_unsafe_h
    name = nil
    params[:params].split(%r{/}).each { |v|
      if name
        data[name.to_sym] = v
        name = nil
      else
        name = v
      end
    }
    logger.debug JSON.pretty_generate(data)

    render json: {}
  end
end
