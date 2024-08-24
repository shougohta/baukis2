require "rails_helper"

RSpec.describe StaffMember, type: :model do
  describe "#password=" do
    it "文字列を与えると、hashed_password は長さ60 の文字列になる" do
      member = StaffMember.new
      member.password = "baukis"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.length).to eq(60)  # ハッシュ化されたパスワードの長さが60であることを確認
    end

    it "nilを与えると、hashed_password はnilになる" do
      member = StaffMember.new(hashed_password: "x")
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
