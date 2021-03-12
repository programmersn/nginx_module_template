require "spec_helper"

describe "Integration Specs" do

    describe "Bootstrap >> " do 
        it "Nginx webserver is up" do
            http = Curl.get("http://localhost:8888") 

            expect(http.response_code).to be_between(200, 299).inclusive.or be_between(300, 399).inclusive
        end
    end

end