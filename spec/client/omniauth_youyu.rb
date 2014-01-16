require 'spec_helper'
require 'oauth2'

describe OmniauthYouyu do
  before(:all)
    client_id     = '91bacf72e1108c2808aa87e5b6a1de62beb41f74a6dc4ce791fc0ce00115ab8f' # your client's id generated with rake db:setup
    client_secret = '33e474e49760086a67f058809265d85738781ee485b3f884c4b871aa8576e6aa' # your client's secret
    redirect_uri  = 'urn:ietf:wg:oauth:2.0:oob' # your client's redirect uri
    site = "http://passport.youyu.im"
    client = OAuth2::Client.new(client_id, client_secret, :site => site)
  end

  it "get Authorization Code" do
    code = client.auth_code.authorize_url(:redirect_uri => redirect_uri)
    code.should_not eq nil
  end

end
end