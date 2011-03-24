# encoding: utf-8
require 'spec_helper'

describe "Ruby 1.9 Extensions" do
  
  describe "force encoding" do
    
    it "should not raise an error when sent an invalid encoding and return as is" do
      lambda do
        Mail::Ruby19.force_encoding("foo", "random_encoding").should == "foo"
      end.should_not raise_exception
    end
    
  end
  
  describe "fix encodings" do
    
    it "should replace \"iso-8859-1\"content-transfer-encoding: with iso-8859-1" do
      Mail::Ruby19.fix_encoding("\"iso-8859-1\"content-transfer-encoding: with iso-8859-1").should == "ISO-8859-1"
    end
    
    it "should replace \"us-ascii\"content-transfer-encoding: quoted-printable" do
      Mail::Ruby19.fix_encoding("\"us-ascii\"content-transfer-encoding: quoted-printable").should == "us-ascii"
    end
    
    it "should replace \"us-ascii\" with us-ascii" do
      Mail::Ruby19.fix_encoding("\"us-ascii\"").should == "us-ascii"
    end
    
    it "should replace \"ISO646-US\" with US-ASCII" do
      Mail::Ruby19.fix_encoding("ISO646-US").should == "US-ASCII"
    end
    
  end
end