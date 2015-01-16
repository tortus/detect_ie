require 'spec_helper'

describe DetectIE do

  IE_8_USER_AGENT_STRING = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)"

  let(:user_agent) { IE_8_USER_AGENT_STRING }

  let(:mock_controller) do
    Class.new do
      include DetectIE
    end
  end

  subject do
    controller = mock_controller.new
    controller.stub(:request) do
      double("request").tap do |rq|
        rq.stub(:env) { {'HTTP_USER_AGENT' => user_agent} }
      end
    end
    controller
  end

  context "when included" do
    it "calls helper_method for all DetectIE methods" do
      controller_cls = Class.new
      controller_cls.stub(:helper_method) { nil }
      controller_cls.send(:include, DetectIE)
      expect(controller_cls).to have_received(:helper_method).with(:ie_version, :force_ie_version!, :ie_8_or_less?, :force_ie_8!)
    end
    it "doesn't call helper_method if base class not respond to it" do
      controller_cls = Class.new
      expect {
        controller_cls.send(:include, DetectIE)
      }.not_to raise_error(NoMethodError)
    end
  end

  describe "#ie_version" do
    it "returns 8 when user agent string is IE 8" do
      expect(subject.send(:ie_version)).to eq(8)
    end
    context "when user agent string doesn't look like IE at all" do
      let(:user_agent) { "ANYTHING" }
      it "returns 10" do
        expect(subject.send(:ie_version)).to eq(10)
      end
    end
    context "when #force_ie_version! has been called" do
      before do
        subject.send(:force_ie_version!, 7)
      end

      it "returns the forced IE version" do
        expect(subject.send(:ie_version)).to eq(7)
      end
    end
  end
end
