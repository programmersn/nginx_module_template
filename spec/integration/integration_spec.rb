require "spec_helper"

describe "Integration Specs" do

    describe "Bootstrap" do 
        it "Nginx Webserver is Running" do
            expect(Curl.get("http://localhost:8888").response_code).to eq(200)
        end
    end

end