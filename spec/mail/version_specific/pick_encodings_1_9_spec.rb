# encoding: utf-8
require 'spec_helper'

describe "Ruby 1.9 Extensions" do

  describe "pick_encoding" do

    it "should replace \"iso-8859-1\"content-transfer-encoding: with iso-8859-1" do
      Mail::Ruby19.pick_encoding("\"iso-8859-1\"content-transfer-encoding: with iso-8859-1").should == "ISO-8859-1"
    end

    it "should replace \"us-ascii\"content-transfer-encoding: quoted-printable" do
      Mail::Ruby19.pick_encoding("\"us-ascii\"content-transfer-encoding: quoted-printable").should == "us-ascii"
    end

    it "should replace \"us-ascii\" with us-ascii" do
      Mail::Ruby19.pick_encoding("\"us-ascii\"").should == "us-ascii"
    end

    it "should replace \"ISO646-US\" with US-ASCII" do
      Mail::Ruby19.pick_encoding("ISO646-US").should == Encoding::ASCII
    end

  end
end