require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}

  it {expect(user).to respond_to(:email)}

  #sem shoulda-matchers
  # context 'when name is blank' do
  #   before (:each) { user.name = " " }
  #
  #   it { expect(user).not_to be_valid }
  # end
  #
  # context 'when name is nil' do
  #   before { user.name = nil }
  #   it { expect(user).not_to be_valid}
  # end

  #fazendo tudo com o shoulda-matchers
  it { expect(user).to validate_presence_of(:name) }
  #ou
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to allow_value("xyz@xpt.com").for(:email) }
end
