RSpec.describe ApplicationHelper, :type => :helper do
  describe "Application Helper" do
    it "Change format of datetime for AM" do
      expect(format_date(DateTime.new(2015,01,15,10,15))).to eq("on 01/15/2015 at 10:15AM")
    end
    it "Change format of datetime for PM" do
      expect(format_date(DateTime.new(2016,11,02,17,27))).to eq("on 11/02/2016 at 05:27PM")
    end
  end
end
